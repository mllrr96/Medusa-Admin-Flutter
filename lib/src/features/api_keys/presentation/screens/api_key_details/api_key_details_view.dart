import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/date_time_extension.dart';
import 'package:medusa_admin/src/core/extensions/medusa_model_extension.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/features/api_keys/presentation/bloc/api_key_crud/api_key_crud_bloc.dart';
import 'package:medusa_admin/src/features/sales_channels/presentation/bloc/sales_channel_crud/sales_channel_crud_bloc.dart';
import 'package:medusa_admin/src/features/store_details/presentation/screens/store_details/store_details_fab.dart';
import 'package:medusa_admin/src/features/team/presentation/bloc/user_crud/user_crud_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class ApiKeyDetailsView extends StatefulWidget {
  const ApiKeyDetailsView({super.key, required this.apiKey});

  final ApiKey apiKey;

  @override
  State<ApiKeyDetailsView> createState() => _ApiKeyDetailsViewState();
}

class _ApiKeyDetailsViewState extends State<ApiKeyDetailsView> {
  late final UserCrudBloc userCrudBloc;
  late final SalesChannelCrudBloc channelBloc;
  late final ApiKeyCrudBloc apiKeyCrudBloc;
  List<SalesChannel> selectedChannels = [];

  ApiKey get apiKey => widget.apiKey;

  bool get isPublishable => apiKey.type == ApiKeyType.publishable;

  @override
  void initState() {
    userCrudBloc = UserCrudBloc.instance;
    channelBloc = SalesChannelCrudBloc.instance;
    apiKeyCrudBloc = ApiKeyCrudBloc.instance;
    if (isPublishable) {
      channelBloc.add(
        SalesChannelCrudEvent.loadAll(
          queryParameters: {'publishable_key_id': apiKey.id},
        ),
      );
    }
    userCrudBloc.add(UserCrudEvent.load(apiKey.createdBy));
    super.initState();
  }

  @override
  void dispose() {
    userCrudBloc.close();
    channelBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const space = Gap(10);
    return BlocListener<ApiKeyCrudBloc, ApiKeyCrudState>(
      bloc: apiKeyCrudBloc,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            loading();
          },
          apiKey: (apiKey) {
            dismissLoading();
            channelBloc.add(
              SalesChannelCrudEvent.loadAll(
                queryParameters: {'publishable_key_id': apiKey.id},
              ),
            );
            setState(() => selectedChannels.clear());
          },
          error: (e) {
            dismissLoading();
            context.showSnackBar(e.toSnackBarString());
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('API Key Details'),
        ),
        floatingActionButton: selectedChannels.isNotEmpty
            ? StoreDetailsFab(
                currenciesCount: selectedChannels.length,
                onClear: () {
                  selectedChannels.clear();
                  setState(() {});
                },
                onRemove: () async {
                  if (!await shouldRemove(selectedChannels.length)) {
                    return;
                  }
                  apiKeyCrudBloc.add(
                    ApiKeyCrudEvent.removeSalesChannels(
                      apiKey.id,
                      selectedChannels.map((e) => e.id).toList(),
                    ),
                  );
                },
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          children: [
            FlexExpansionTile(
              initiallyExpanded: true,
              title: Text(apiKey.title),
              childPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: apiKey.type == ApiKeyType.secret
                        ? null
                        : () async {
                            await Clipboard.setData(ClipboardData(text: apiKey.token));
                            if (!context.mounted) return;
                            context.showSnackBar('API Key copied to clipboard');
                          },
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    child: Ink(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Key'),
                          Row(
                            children: [
                              Text(apiKey.redacted),
                              if(isPublishable)
                              Row(
                                children: [
                                  space,
                                  Icon(LucideIcons.copy),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  space,
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Type'),
                        Text(apiKey.type.name.capitalize),
                      ],
                    ),
                  ),
                  space,
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Last used at'),
                        Text(apiKey.lastUsedAt?.formatDate() ?? '-'),
                      ],
                    ),
                  ),
                  space,
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Created by'),
                        BlocBuilder<UserCrudBloc, UserCrudState>(
                          bloc: userCrudBloc,
                          builder: (context, state) {
                            return state.maybeWhen(
                                loading: () => Skeletonizer(child: Text('Loading...')),
                                user: (user) => Text(user.fullName),
                                orElse: () => Text('-'));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            space,
            if (isPublishable)
              FlexExpansionTile(
                initiallyExpanded: true,
                title: const Text('Sales Channels'),
                childPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                trailing: TextButton.icon(
                    onPressed: () async {
                      final result = await showBarModalBottomSheet<List<String>?>(
                          context: context,
                          overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                          backgroundColor: context.theme.scaffoldBackgroundColor,
                          builder: (context) =>
                              SaleChannelsSelectWidget(initiallySelected: selectedChannels));
                      if (result == null || result.isEmpty) return;
                      final list = result + selectedChannels.map((e) => e.id).toList();
                      final uniqueList = list.toSet().toList();
                      apiKeyCrudBloc.add(
                        ApiKeyCrudEvent.addSalesChannels(apiKey.id, uniqueList),
                      );
                    },
                    label: const Text('Add'),
                    icon: const Icon(Icons.add)),
                child: BlocBuilder<SalesChannelCrudBloc, SalesChannelCrudState>(
                    bloc: channelBloc,
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () => const Center(child: CircularProgressIndicator()),
                        salesChannels: (channels, _) {
                          if (channels.isEmpty) {
                            return const Text('No sales channels associated with this key.');
                          }
                          return Column(
                            children: channels.map((currency) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                  onTap: () {
                                    final isSelected = selectedChannels.contains(currency);
                                    if (isSelected) {
                                      selectedChannels
                                          .removeWhere((element) => element.id == currency.id);
                                    } else {
                                      selectedChannels.add(currency);
                                    }
                                    setState(() {});
                                  },
                                  child: Ink(
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                    ),
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          value: selectedChannels.contains(currency),
                                          onChanged: (value) {
                                            if (value == null) return;
                                            if (!value) {
                                              selectedChannels.removeWhere(
                                                  (element) => element.id == currency.id);
                                            } else {
                                              selectedChannels.add(currency);
                                            }
                                            setState(() {});
                                          },
                                        ),
                                        const Gap(5),
                                        Text(currency.name),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                        error: (e) => Text(e.toSnackBarString()),
                        orElse: () => const SizedBox.shrink(),
                      );
                    }),
              ),
          ],
        ),
      ),
    );
  }

  Future<bool> shouldRemove(int count) async => await showOkCancelAlertDialog(
        context: context,
        title: 'Are you sure?',
        message:
            'You are about to remove $count sales channel from the API key. This action cannot be undone.',
        okLabel: 'Remove',
        isDestructiveAction: true,
      ).then((value) => value == OkCancelResult.ok);
}

// TODO: Refactor to a reusable widget
class SaleChannelsSelectWidget extends StatefulWidget {
  const SaleChannelsSelectWidget({super.key, required this.initiallySelected});

  final List<SalesChannel> initiallySelected;

  @override
  State<SaleChannelsSelectWidget> createState() => _SaleChannelsSelectWidgetState();
}

class _SaleChannelsSelectWidgetState extends State<SaleChannelsSelectWidget> {
  List<String> selectedChannels = [];
  late SalesChannelCrudBloc salesChannelCrudBloc;
  final pagingController =
      PagingController<int, SalesChannel>(firstPageKey: 0, invisibleItemsThreshold: 6);

  void _loadPage(int page) {
    salesChannelCrudBloc.add(
      SalesChannelCrudEvent.loadAll(queryParameters: {
        'offset': page == 0 ? 0 : pagingController.itemList?.length,
      }),
    );
  }

  @override
  void initState() {
    salesChannelCrudBloc = SalesChannelCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    salesChannelCrudBloc.close();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SalesChannelCrudBloc, SalesChannelCrudState>(
      bloc: salesChannelCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          salesChannels: (state) async {
            final isLastPage = state.salesChannels.length < SalesChannelCrudBloc.pageSize;
            pagingController.removePageRequestListener(_loadPage);
            pagingController.value =
                const PagingState(nextPageKey: null, error: null, itemList: null);
            await Future.delayed(const Duration(milliseconds: 250));
            if (isLastPage) {
              pagingController.appendLastPage(state.salesChannels);
            } else {
              final nextPageKey = pagingController.nextPageKey ?? 0 + state.salesChannels.length;
              pagingController.appendPage(state.salesChannels, nextPageKey);
            }
            pagingController.addPageRequestListener(_loadPage);
          },
          error: (state) {
            pagingController.error = state.failure;
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Select Sales Channels'),
          actions: [
            TextButton(
                onPressed: selectedChannels.isEmpty
                    ? null
                    : () {
                        context.pop(selectedChannels);
                      },
                child: const Text('Done')),
          ],
        ),
        body: SafeArea(
          child: PagedListView.separated(
            separatorBuilder: (_, __) => const Divider(height: 0, indent: 16.0),
            padding: const EdgeInsets.only(bottom: kToolbarHeight),
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<SalesChannel>(
                animateTransitions: true,
                itemBuilder: (context, salesChannel, index) => InkWell(
                      onTap: () {
                        final isSelected = selectedChannels.contains(salesChannel.id);
                        if (isSelected) {
                          selectedChannels.removeWhere((element) => element == salesChannel.id);
                        } else {
                          selectedChannels.add(salesChannel.id);
                        }
                        setState(() {});
                      },
                      child: Ink(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              value: selectedChannels.contains(salesChannel.id),
                              onChanged: (value) {
                                if (value == null) return;
                                if (!value) {
                                  selectedChannels
                                      .removeWhere((element) => element == salesChannel.id);
                                } else {
                                  selectedChannels.add(salesChannel.id);
                                }
                                setState(() {});
                              },
                            ),
                            const Gap(5),
                            Text(salesChannel.name),
                          ],
                        ),
                      ),
                    ),
                // firstPageProgressIndicatorBuilder: (_) => const SalesChannelsLoadingPage(),
                firstPageErrorIndicatorBuilder: (_) =>
                    PaginationErrorPage(pagingController: pagingController)),
          ),
        ),
      ),
    );
  }
}
