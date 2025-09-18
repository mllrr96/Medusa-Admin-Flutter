import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/date_time_extension.dart';
import 'package:medusa_admin/src/core/extensions/medusa_model_extension.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/features/api_keys/presentation/bloc/api_key_crud/api_key_crud_bloc.dart';
import 'package:medusa_admin/src/features/api_keys/presentation/screens/api_key_details/api_key_status.dart';
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
  late final ApiKeyCrudBloc apiSaleChannelsBloc;
  late final ApiKeyCrudBloc apiCrudBloc;
  List<SalesChannel> selectedChannels = [];

  late ApiKey apiKey;

  bool get isPublishable => apiKey.type == ApiKeyType.publishable;

  @override
  void initState() {
    apiKey = widget.apiKey;
    userCrudBloc = UserCrudBloc.instance;
    channelBloc = SalesChannelCrudBloc.instance;
    apiSaleChannelsBloc = ApiKeyCrudBloc.instance;
    apiCrudBloc = ApiKeyCrudBloc.instance;
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
    apiCrudBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    const space = Gap(10);
    return MultiBlocListener(
      listeners: [
        BlocListener<ApiKeyCrudBloc, ApiKeyCrudState>(
          bloc: apiSaleChannelsBloc,
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
        ),
        BlocListener<ApiKeyCrudBloc, ApiKeyCrudState>(
          bloc: apiCrudBloc,
          listener: (context, state) {
            state.whenOrNull(loading: () {
              loading();
            }, apiKey: (apiKey) {
              dismissLoading();
              setState(() => this.apiKey = apiKey);
              context.showSnackBar('API Key revoked successfully');
            }, error: (e) {
              dismissLoading();
              context.showSnackBar(e.toSnackBarString());
            }, deleted: () {
              dismissLoading();
              context.showSnackBar('API Key deleted successfully');
              context.pop(true);
            });
          },
        ),
      ],
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
                  apiSaleChannelsBloc.add(
                    ApiKeyCrudEvent.removeSalesChannels(
                      apiKey.id,
                      selectedChannels.map((e) => e.id).toList(),
                    ),
                  );
                },
              )
            : SpeedDial(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                animatedIcon: AnimatedIcons.menu_close,
                spacing: 10,
                children: [
                  SpeedDialChild(
                    child: const Icon(LucideIcons.pen),
                    label: 'Edit',
                    labelStyle: smallTextStyle,
                    onTap: () async {
                      final result = await context.pushRoute<bool>(
                        AddUpdateApiKeyRoute(apiKey: apiKey),
                      );
                      if (result == true) {
                        apiCrudBloc.add(ApiKeyCrudEvent.load(apiKey.id));
                      }
                    },
                    onLongPress: () {},
                  ),
                  SpeedDialChild(
                    child: const Icon(LucideIcons.circleX),
                    label: 'Revoke API Key',
                    labelStyle: smallTextStyle,
                    visible: apiKey.revokedAt == null,
                    onTap: () async {
                      final result = await showOkCancelAlertDialog(
                        context: context,
                        title: 'Are you sure?',
                        message:
                            'You are about to revoke this API key. This action cannot be undone.',
                        okLabel: 'Revoke',
                        isDestructiveAction: true,
                      );
                      if (result == OkCancelResult.ok) {
                        apiCrudBloc.add(ApiKeyCrudEvent.revoke(apiKey.id));
                      }
                    },
                    onLongPress: () {},
                  ),
                  SpeedDialChild(
                    child: const Icon(LucideIcons.trash),
                    label: 'Delete',
                    labelStyle: smallTextStyle,
                    visible: apiKey.revokedAt != null,
                    onTap: () async {
                      final result = await showOkCancelAlertDialog(
                        context: context,
                        title: 'Are you sure?',
                        message:
                            'You are about to delete this API key. This action cannot be undone.',
                        okLabel: 'Delete',
                        isDestructiveAction: true,
                      );
                      if (result != OkCancelResult.ok) return;
                      apiCrudBloc.add(ApiKeyCrudEvent.delete(apiKey.id));
                    },
                    onLongPress: () {},
                  ),
                ],
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          children: [
            FlexExpansionTile(
              initiallyExpanded: true,
              title: Text(apiKey.title),
              trailing: ApiKeyStatus(apiKey),
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
                              if (isPublishable)
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
                      apiSaleChannelsBloc.add(
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
