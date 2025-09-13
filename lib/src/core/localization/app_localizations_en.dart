// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get backButtonGoBack => 'Go back';

  @override
  String get filterMenuTrigger => 'View';

  @override
  String get filterMenuClearButton => 'Clear';

  @override
  String get filterMenuSelectItemDefaultPlaceholder => 'Select filter';

  @override
  String get filterMenuSelectItemClearButton => 'Clear the selected options';

  @override
  String get filterMenuSelectItemSelected => 'Selected';

  @override
  String get filterMenuDateItemBefore => 'Before';

  @override
  String get filterMenuDateItemAfter => 'After';

  @override
  String get filterMenuDateItemBetween => 'Between';

  @override
  String salesChannelsDisplayAvailableCount(
      String availableChannelsCount, String totalChannelsCount) {
    return 'Available in $availableChannelsCount out of $totalChannelsCount Sales Channels';
  }

  @override
  String get activityDrawerActivity => 'Activity';

  @override
  String get activityDrawerNoNotificationsTitle => 'It\'s quiet in here...';

  @override
  String get activityDrawerNoNotificationsDescription =>
      'You don\'t have any notifications at the moment, but once you do they will live here.';

  @override
  String get activityDrawerErrorTitle => 'Oh no...';

  @override
  String get activityDrawerErrorDescription =>
      'Something went wrong while trying to fetch your notifications - We will keep trying!';

  @override
  String get activityDrawerProcessing => 'Processing...';

  @override
  String get analyticsConfigFormTitle => 'Anonymize my usage data';

  @override
  String get analyticsConfigFormDescription =>
      'You can choose to anonymize your usage data. If this option is selected, we will not collect your personal information, such as your name and email address.';

  @override
  String get analyticsConfigFormOptOut => 'Opt out of sharing my usage data';

  @override
  String get analyticsConfigFormOptOutLater =>
      'You can always opt out of sharing your usage data at any time.';

  @override
  String get analyticsPreferencesSuccess => 'Success';

  @override
  String get analyticsPreferencesYourPreferencesWereSuccessfullyUpdated =>
      'Your preferences were successfully updated';

  @override
  String get analyticsPreferencesError => 'Error';

  @override
  String get analyticsPreferencesHelpUsGetBetter => 'Help us get better';

  @override
  String get analyticsPreferencesDisclaimer =>
      'To create the most compelling e-commerce experience we would like to gain insights in how you use Medusa. User insights allow us to build a better, more engaging, and more usable products. We only collect data for product improvements. Read what data we gather in our';

  @override
  String get analyticsPreferencesDocumentation => 'documentation';

  @override
  String get analyticsPreferencesPleaseEnterAValidEmail =>
      'Please enter a valid email';

  @override
  String get analyticsPreferencesContinue => 'Continue';

  @override
  String get currencyInputCurrency => 'Currency';

  @override
  String get currencyInputAmountIsNotValid => 'Amount is not valid';

  @override
  String get organismsSuccess => 'Success';

  @override
  String get organismsDeleteSuccessful => 'Delete successful';

  @override
  String get organismsAreYouSureYouWantToDelete =>
      'Are you sure you want to delete?';

  @override
  String get organismsNoCancel => 'No, cancel';

  @override
  String get organismsYesRemove => 'Yes, remove';

  @override
  String get detailsCollapsibleHideAdditionalDetails =>
      'Hide additional details';

  @override
  String get detailsCollapsibleShowAdditionalDetails =>
      'Show additional details';

  @override
  String get editUserModalSuccess => 'Success';

  @override
  String get editUserModalUserWasUpdated => 'User was updated';

  @override
  String get editUserModalError => 'Error';

  @override
  String get editUserModalEditUser => 'Edit User';

  @override
  String get editUserModalFirstNameLabel => 'First Name';

  @override
  String get editUserModalFirstNamePlaceholder => 'First name...';

  @override
  String get editUserModalLastNameLabel => 'Last Name';

  @override
  String get editUserModalLastNamePlaceholder => 'Last name...';

  @override
  String get editUserModalEmail => 'Email';

  @override
  String get editUserModalCancel => 'Cancel';

  @override
  String get editUserModalSave => 'Save';

  @override
  String get errorBoundaryBackToDashboard => 'Back to dashboard';

  @override
  String get errorBoundaryAnUnknownErrorOccured => 'An unknown error occured';

  @override
  String get errorBoundaryBadRequest => 'Bad request';

  @override
  String get errorBoundaryYouAreNotLoggedIn => 'You are not logged in';

  @override
  String get errorBoundaryYouDoNotHavePermissionPerformThisAction =>
      'You do not have permission to perform this action';

  @override
  String get errorBoundaryPageWasNotFound => 'Page was not found';

  @override
  String get errorBoundaryAnUnknownServerErrorOccured =>
      'An unknown server error occured';

  @override
  String get errorBoundary503 => 'Server is currently unavailable';

  @override
  String get errorBoundary500 =>
      'An error occurred with unspecified causes, this is most likely due to a techinical issue on our end. Please try refreshing the page. If the issue keeps happening, contact your administrator.';

  @override
  String get errorBoundary400 =>
      'The request was malformed, fix your request and please try again.';

  @override
  String get errorBoundary401 =>
      'You are not logged in, please log in to proceed.';

  @override
  String get errorBoundary403 =>
      'You do not have permission to perform this action, if you think this is a mistake, contact your administrator.';

  @override
  String get errorBoundary404 =>
      'The page you have requested was not found, please check the URL and try again.';

  @override
  String get errorBoundary5002 =>
      'The server was not able to handle your request, this is mostly likely due to a techinical issue on our end. Please try again. If the issue keeps happening, contact your administrator.';

  @override
  String get errorBoundary5032 =>
      'The server is temporarily unavailable, and your request could not be processed. Please try again later. If the issue keeps happening, contact your administrator.';

  @override
  String get exportModalTitle => 'Initialize an export of your data';

  @override
  String get exportModalCancel => 'Cancel';

  @override
  String get exportModalExport => 'Export';

  @override
  String get fileUploadModalUploadANewPhoto => 'Upload a new photo';

  @override
  String get giftCardBannerEdit => 'Edit';

  @override
  String get giftCardBannerUnpublish => 'Unpublish';

  @override
  String get giftCardBannerPublish => 'Publish';

  @override
  String get giftCardBannerDelete => 'Delete';

  @override
  String get giftCardBannerPublished => 'Published';

  @override
  String get giftCardBannerUnpublished => 'Unpublished';

  @override
  String get giftCardDenominationsSectionDenominationAdded =>
      'Denomination added';

  @override
  String get giftCardDenominationsSectionANewDenominationWasSuccessfullyAdded =>
      'A new denomination was successfully added';

  @override
  String
      get giftCardDenominationsSectionADenominationWithThatDefaultValueAlreadyExists =>
          'A denomination with that default value already exists';

  @override
  String get giftCardDenominationsSectionError => 'Error';

  @override
  String get giftCardDenominationsSectionAddDenomination => 'Add Denomination';

  @override
  String get giftCardDenominationsSectionCancel => 'Cancel';

  @override
  String get giftCardDenominationsSectionSaveAndClose => 'Save and close';

  @override
  String get giftCardDenominationsSectionDenominationUpdated =>
      'Denomination updated';

  @override
  String
      get giftCardDenominationsSectionANewDenominationWasSuccessfullyUpdated =>
          'A new denomination was successfully updated';

  @override
  String get giftCardDenominationsSectionEditDenomination =>
      'Edit Denomination';

  @override
  String get giftCardDenominationsSectionDenominations => 'Denominations';

  @override
  String get giftCardDenominationsSectionDenomination => 'Denomination';

  @override
  String get giftCardDenominationsSectionInOtherCurrencies =>
      'In other currencies';

  @override
  String giftCardDenominationsSectionAndMoreOne(String count) {
    return ', and $count more';
  }

  @override
  String giftCardDenominationsSectionAndMoreOther(String count) {
    return ', and $count more';
  }

  @override
  String get giftCardDenominationsSectionDeleteDenomination =>
      'Delete denomination';

  @override
  String get giftCardDenominationsSectionConfirmDelete =>
      'Are you sure you want to delete this denomination?';

  @override
  String get giftCardDenominationsSectionDenominationDeleted =>
      'Denomination deleted';

  @override
  String get giftCardDenominationsSectionDenominationWasSuccessfullyDeleted =>
      'Denomination was successfully deleted';

  @override
  String get giftCardDenominationsSectionEdit => 'Edit';

  @override
  String get giftCardDenominationsSectionDelete => 'Delete';

  @override
  String get helpDialogHowCanWeHelp => 'How can we help?';

  @override
  String get helpDialogWeUsuallyRespondInAFewHours =>
      'We usually respond in a few hours';

  @override
  String get helpDialogSubject => 'Subject';

  @override
  String get helpDialogWhatIsItAbout => 'What is it about?...';

  @override
  String get helpDialogWriteAMessage => 'Write a message...';

  @override
  String get helpDialogFeelFreeToJoinOurCommunityOf =>
      'Feel free to join our community of';

  @override
  String get helpDialogMerchantsAndECommerceDevelopers =>
      'merchants and e-commerce developers';

  @override
  String get helpDialogSendAMessage => 'Send a message';

  @override
  String get inviteModalSuccess => 'Success';

  @override
  String inviteModalInvitationSentTo(String user) {
    return 'Invitation sent to $user';
  }

  @override
  String get inviteModalError => 'Error';

  @override
  String get inviteModalMember => 'Member';

  @override
  String get inviteModalAdmin => 'Admin';

  @override
  String get inviteModalDeveloper => 'Developer';

  @override
  String get inviteModalInviteUsers => 'Invite Users';

  @override
  String get inviteModalEmail => 'Email';

  @override
  String get inviteModalRole => 'Role';

  @override
  String get inviteModalSelectRole => 'Select role';

  @override
  String get inviteModalCancel => 'Cancel';

  @override
  String get inviteModalInvite => 'Invite';

  @override
  String get loginCardNoMatch => 'These credentials do not match our records.';

  @override
  String get loginCardLogInToMedusa => 'Log in to Medusa';

  @override
  String get loginCardEmail => 'Email';

  @override
  String get loginCardPassword => 'Password';

  @override
  String get loginCardForgotYourPassword => 'Forgot your password?';

  @override
  String get metadataAddMetadata => 'Add Metadata';

  @override
  String get productAttributesSectionEditAttributes => 'Edit Attributes';

  @override
  String get productAttributesSectionDimensions => 'Dimensions';

  @override
  String
      get productAttributesSectionConfigureToCalculateTheMostAccurateShippingRates =>
          'Configure to calculate the most accurate shipping rates';

  @override
  String get productAttributesSectionCustoms => 'Customs';

  @override
  String get productAttributesSectionCancel => 'Cancel';

  @override
  String get productAttributesSectionSave => 'Save';

  @override
  String get productAttributesSectionTitle => 'Attributes';

  @override
  String get productAttributesSectionHeight => 'Height';

  @override
  String get productAttributesSectionWidth => 'Width';

  @override
  String get productAttributesSectionLength => 'Length';

  @override
  String get productAttributesSectionWeight => 'Weight';

  @override
  String get productAttributesSectionMidCode => 'MID Code';

  @override
  String get productAttributesSectionHsCode => 'HS Code';

  @override
  String get productAttributesSectionCountryOfOrigin => 'Country of origin';

  @override
  String get productGeneralSectionSuccess => 'Success';

  @override
  String get productGeneralSectionSuccessfullyUpdatedSalesChannels =>
      'Successfully updated sales channels';

  @override
  String get productGeneralSectionError => 'Error';

  @override
  String get productGeneralSectionFailedToUpdateSalesChannels =>
      'Failed to update sales channels';

  @override
  String get productGeneralSectionEditGeneralInformation =>
      'Edit General Information';

  @override
  String get productGeneralSectionGiftCard => 'Gift Card';

  @override
  String get productGeneralSectionProduct => 'Product';

  @override
  String get productGeneralSectionMetadata => 'Metadata';

  @override
  String get productGeneralSectionCancel => 'Cancel';

  @override
  String get productGeneralSectionSave => 'Save';

  @override
  String get productGeneralSectionDelete => 'Delete';

  @override
  String get productGeneralSectionEditSalesChannels => 'Edit Sales Channels';

  @override
  String get productGeneralSectionPublished => 'Published';

  @override
  String get productGeneralSectionDraft => 'Draft';

  @override
  String get productGeneralSectionDetails => 'Details';

  @override
  String get productGeneralSectionSubtitle => 'Subtitle';

  @override
  String get productGeneralSectionHandle => 'Handle';

  @override
  String get productGeneralSectionType => 'Type';

  @override
  String get productGeneralSectionCollection => 'Collection';

  @override
  String get productGeneralSectionCategory => 'Category';

  @override
  String get productGeneralSectionPromotionable => 'Promotionable';

  @override
  String get productGeneralSectionTrue => 'True';

  @override
  String get productGeneralSectionFalse => 'False';

  @override
  String productGeneralSectionCountOne(String count) {
    return '$count';
  }

  @override
  String productGeneralSectionCountOther(String count) {
    return 'count';
  }

  @override
  String get productGeneralSectionSalesChannels => 'Sales channels';

  @override
  String get productMediaSectionEditMedia => 'Edit Media';

  @override
  String get productMediaSectionUploadImagesError =>
      'Something went wrong while trying to upload images.';

  @override
  String get productMediaSectionFileServiceNotConfigured =>
      'You might not have a file service configured. Please contact your administrator';

  @override
  String get productMediaSectionError => 'Error';

  @override
  String get productMediaSectionMedia => 'Media';

  @override
  String get productMediaSectionAddImagesToYourProduct =>
      'Add images to your product.';

  @override
  String get productMediaSectionCancel => 'Cancel';

  @override
  String get productMediaSectionSaveAndClose => 'Save and close';

  @override
  String get productRawSectionRawGiftCard => 'Raw Gift Card';

  @override
  String get productRawSectionRawProduct => 'Raw Product';

  @override
  String get productThumbnailSectionSuccess => 'Success';

  @override
  String get productThumbnailSectionSuccessfullyDeletedThumbnail =>
      'Successfully deleted thumbnail';

  @override
  String get productThumbnailSectionError => 'Error';

  @override
  String get productThumbnailSectionEdit => 'Edit';

  @override
  String get productThumbnailSectionUpload => 'Upload';

  @override
  String get productThumbnailSectionUploadThumbnailError =>
      'Something went wrong while trying to upload the thumbnail.';

  @override
  String get productThumbnailSectionYouMightNotHaveAFileServiceConfiguredPleaseContactYourAdministrator =>
      'You might not have a file service configured. Please contact your administrator';

  @override
  String get productThumbnailSectionUploadThumbnail => 'Upload Thumbnail';

  @override
  String get productThumbnailSectionThumbnail => 'Thumbnail';

  @override
  String get productThumbnailSectionUsedToRepresentYourProductDuringCheckoutSocialSharingAndMore =>
      'Used to represent your product during checkout, social sharing and more.';

  @override
  String get productThumbnailSectionCancel => 'Cancel';

  @override
  String get productThumbnailSectionSaveAndClose => 'Save and close';

  @override
  String productVariantTreeCountOne(String count) {
    return '$count';
  }

  @override
  String productVariantTreeCountOther(String count) {
    return '$count';
  }

  @override
  String get productVariantTreeAddPrices => 'Add prices';

  @override
  String get productVariantsSectionAddVariant => 'Add Variant';

  @override
  String get productVariantsSectionCancel => 'Cancel';

  @override
  String get productVariantsSectionSaveAndClose => 'Save and close';

  @override
  String get productVariantsSectionEditStockInventory =>
      'Edit stock & inventory';

  @override
  String get productVariantsSectionEditVariant => 'Edit Variant';

  @override
  String get editVariantsModalCancel => 'Cancel';

  @override
  String get editVariantsModalSaveAndGoBack => 'Save and go back';

  @override
  String get editVariantsModalSaveAndClose => 'Save and close';

  @override
  String get editVariantsModalEditVariant => 'Edit Variant';

  @override
  String get editVariantsModalUpdateSuccess =>
      'Variants were successfully updated';

  @override
  String get editVariantsModalEditVariants => 'Edit Variants';

  @override
  String get editVariantsModalProductVariants => 'Product variants';

  @override
  String get editVariantsModalVariant => 'Variant';

  @override
  String get editVariantsModalInventory => 'Inventory';

  @override
  String get productVariantsSectionEditPrices => 'Edit Prices';

  @override
  String get productVariantsSectionEditVariants => 'Edit Variants';

  @override
  String get productVariantsSectionEditOptions => 'Edit Options';

  @override
  String get productVariantsSectionProductVariants => 'Product variants';

  @override
  String get productVariantsSectionError => 'Error';

  @override
  String get productVariantsSectionFailedToUpdateProductOptions =>
      'Failed to update product options';

  @override
  String get productVariantsSectionSuccess => 'Success';

  @override
  String get productVariantsSectionSuccessfullyUpdatedProductOptions =>
      'Successfully updated product options';

  @override
  String get productVariantsSectionProductOptions => 'Product options';

  @override
  String get productVariantsSectionOptionTitle => 'Option title';

  @override
  String get productVariantsSectionOptionTitleIsRequired =>
      'Option title is required';

  @override
  String get productVariantsSectionAddAnOption => 'Add an option';

  @override
  String get productVariantsSectionInventory => 'Inventory';

  @override
  String get productVariantsSectionTitle => 'Title';

  @override
  String get productVariantsSectionSku => 'SKU';

  @override
  String get productVariantsSectionEan => 'EAN';

  @override
  String get productVariantsSectionManageInventory => 'Manage inventory';

  @override
  String get productVariantsSectionDuplicateVariant => 'Duplicate Variant';

  @override
  String get productVariantsSectionDeleteVariantLabel => 'Delete Variant';

  @override
  String get productVariantsSectionYesDelete => 'Yes, delete';

  @override
  String get productVariantsSectionDeleteVariantHeading => 'Delete variant';

  @override
  String get productVariantsSectionConfirmDelete =>
      'Are you sure you want to delete this variant? ';

  @override
  String get productVariantsSectionNoteDeletingTheVariantWillAlsoRemoveInventoryItemsAndLevels =>
      ' Note: Deleting the variant will also remove inventory items and levels';

  @override
  String get resetTokenCardError => 'Error';

  @override
  String get resetTokenCardResetYourPassword => 'Reset your password';

  @override
  String get resetTokenCardPasswordResetDescription =>
      'Enter your email address below, and we\'ll send you instructions on how to reset your password.';

  @override
  String get resetTokenCardEmail => 'Email';

  @override
  String get resetTokenCardThisIsNotAValidEmail => 'This is not a valid email';

  @override
  String get resetTokenCardSendResetInstructions => 'Send reset instructions';

  @override
  String get resetTokenCardSuccessfullySentYouAnEmail =>
      'Successfully sent you an email';

  @override
  String get resetTokenCardGoBackToSignIn => 'Go back to sign in';

  @override
  String get rmaReturnProductTableProductDetails => 'Product Details';

  @override
  String get rmaReturnProductTableQuantity => 'Quantity';

  @override
  String get rmaSelectProductTableProductDetails => 'Product Details';

  @override
  String get rmaSelectProductTableQuantity => 'Quantity';

  @override
  String get rmaSelectProductTableRefundable => 'Refundable';

  @override
  String rmaSelectProductTableImagesWitchCountOne(String count) {
    return '$count';
  }

  @override
  String rmaSelectProductTableImagesWitchCountOther(String count) {
    return '$count';
  }

  @override
  String get rmaSelectProductTableSelectReason => 'Select Reason';

  @override
  String get sidebarStore => 'Store';

  @override
  String get sidebarOrders => 'Orders';

  @override
  String get sidebarProducts => 'Products';

  @override
  String get sidebarCategories => 'Categories';

  @override
  String get sidebarCustomers => 'Customers';

  @override
  String get sidebarInventory => 'Inventory';

  @override
  String get sidebarPromotions => 'Promotions';

  @override
  String get sidebarGiftCards => 'Gift Cards';

  @override
  String get sidebarPricing => 'Pricing';

  @override
  String get sidebarSettings => 'Settings';

  @override
  String tableContainerSoothedOffsetOne(
      String soothedOffset, String pageSize, String count, String title) {
    return '$soothedOffset - $pageSize of $count $title';
  }

  @override
  String tableContainerSoothedOffsetOther(
      String soothedOffset, String pageSize, String count, String title) {
    return '$soothedOffset - $pageSize of $count $title';
  }

  @override
  String tableContainerCurrentPage(
      String currentPage, String soothedPageCount) {
    return '$currentPage of $soothedPageCount';
  }

  @override
  String get timelineRequestReturn => 'Request Return';

  @override
  String get timelineRegisterExchange => 'Register Exchange';

  @override
  String get timelineRegisterClaim => 'Register Claim';

  @override
  String get timelineSuccess => 'Success';

  @override
  String get timelineAddedNote => 'Added note';

  @override
  String get timelineError => 'Error';

  @override
  String get timelineTimeline => 'Timeline';

  @override
  String get uploadModalNew => 'new';

  @override
  String get uploadModalUpdates => 'updates';

  @override
  String get uploadModalDropYourFileHereOr => 'Drop your file here, or';

  @override
  String get uploadModalClickToBrowse => 'click to browse.';

  @override
  String get uploadModalOnlyCsvFilesAreSupported =>
      'Only .csv files are supported.';

  @override
  String uploadModalImportFileTitle(String fileTitle) {
    return 'Import $fileTitle';
  }

  @override
  String get uploadModalCancel => 'Cancel';

  @override
  String get uploadModalImportList => 'Import List';

  @override
  String get addProductsModalAddProducts => 'Add Products';

  @override
  String get addProductsModalSearchByNameOrDescription =>
      'Search by name or description...';

  @override
  String get addProductsModalCancel => 'Cancel';

  @override
  String get addProductsModalSave => 'Save';

  @override
  String get addProductsModalProductDetails => 'Product Details';

  @override
  String get addProductsModalStatus => 'Status';

  @override
  String get addProductsModalVariants => 'Variants';

  @override
  String get templatesGeneral => 'General';

  @override
  String get templatesFirstName => 'First Name';

  @override
  String get templatesLastName => 'Last Name';

  @override
  String get templatesCompany => 'Company';

  @override
  String get templatesPhone => 'Phone';

  @override
  String get templatesBillingAddress => 'Billing Address';

  @override
  String get templatesShippingAddress => 'Shipping Address';

  @override
  String get templatesAddress => 'Address';

  @override
  String get templatesAddress1 => 'Address 1';

  @override
  String get templatesAddress2 => 'Address 2';

  @override
  String get templatesPostalCode => 'Postal code';

  @override
  String get templatesCity => 'City';

  @override
  String get templatesProvince => 'Province';

  @override
  String get templatesCountry => 'Country';

  @override
  String get templatesMetadata => 'Metadata';

  @override
  String get collectionModalSuccess => 'Success';

  @override
  String get collectionModalSuccessfullyUpdatedCollection =>
      'Successfully updated collection';

  @override
  String get collectionModalError => 'Error';

  @override
  String get collectionModalSuccessfullyCreatedCollection =>
      'Successfully created collection';

  @override
  String get collectionModalEditCollection => 'Edit Collection';

  @override
  String get collectionModalAddCollection => 'Add Collection';

  @override
  String get collectionModalDescription =>
      'To create a collection, all you need is a title and a handle.';

  @override
  String get collectionModalDetails => 'Details';

  @override
  String get collectionModalTitleLabel => 'Title';

  @override
  String get collectionModalTitlePlaceholder => 'Sunglasses';

  @override
  String get collectionModalHandleLabel => 'Handle';

  @override
  String get collectionModalHandlePlaceholder => 'sunglasses';

  @override
  String get collectionModalSlugDescription =>
      'URL Slug for the collection. Will be auto generated if left blank.';

  @override
  String get collectionModalMetadata => 'Metadata';

  @override
  String get collectionModalCancel => 'Cancel';

  @override
  String get collectionModalSaveCollection => 'Save collection';

  @override
  String get collectionModalPublishCollection => 'Publish collection';

  @override
  String get collectionProductTableAddProducts => 'Add Products';

  @override
  String get collectionProductTableProducts => 'Products';

  @override
  String get collectionProductTableSearchProducts => 'Search Products';

  @override
  String get collectionProductTableCancel => 'Cancel';

  @override
  String get collectionProductTableSave => 'Save';

  @override
  String get collectionProductTableSortBy => 'Sort by';

  @override
  String get collectionProductTableAll => 'All';

  @override
  String get collectionProductTableNewest => 'Newest';

  @override
  String get collectionProductTableOldest => 'Oldest';

  @override
  String get collectionProductTableTitle => 'Title';

  @override
  String get collectionProductTableDecideStatusPublished => 'Published';

  @override
  String get collectionProductTableDraft => 'Draft';

  @override
  String get collectionProductTableProposed => 'Proposed';

  @override
  String get collectionProductTableRejected => 'Rejected';

  @override
  String get collectionProductTableRemoveProductFromCollection =>
      'Remove product from collection';

  @override
  String get collectionProductTableProductRemovedFromCollection =>
      'Product removed from collection';

  @override
  String get collectionsTableDeleteCollection => 'Delete Collection';

  @override
  String get collectionsTableConfirmDelete =>
      'Are you sure you want to delete this collection?';

  @override
  String get collectionsTableEdit => 'Edit';

  @override
  String get collectionsTableDelete => 'Delete';

  @override
  String get collectionsTableTitle => 'Title';

  @override
  String get collectionsTableHandle => 'Handle';

  @override
  String get collectionsTableCreatedAt => 'Created At';

  @override
  String get collectionsTableUpdatedAt => 'Updated At';

  @override
  String get collectionsTableProducts => 'Products';

  @override
  String get customerGroupTableDetails => 'Details';

  @override
  String get customerGroupTableDelete => 'Delete';

  @override
  String get customerGroupTableSuccess => 'Success';

  @override
  String get customerGroupTableGroupDeleted => 'Group deleted';

  @override
  String get customerGroupTableError => 'Error';

  @override
  String get customerGroupTableFailedToDeleteTheGroup =>
      'Failed to delete the group';

  @override
  String get customerGroupTableCustomerGroups => 'Customer groups';

  @override
  String get customerGroupTableDeleteFromTheGroup => 'Delete from the group';

  @override
  String get customerGroupTableCustomerGroupsTitle => 'Customer Groups';

  @override
  String get customerGroupTableGroups => 'Groups';

  @override
  String get customerGroupTableAll => 'All';

  @override
  String get customerGroupTableEditCustomers => 'Edit Customers';

  @override
  String get customerGroupTableCustomers => 'Customers';

  @override
  String get customerGroupTableCancel => 'Cancel';

  @override
  String get customerGroupTableSave => 'Save';

  @override
  String get customerOrdersTableOrders => 'Orders';

  @override
  String get customerOrdersTableTransferOrder => 'Transfer order';

  @override
  String get customerOrdersTablePaid => 'Paid';

  @override
  String get customerOrdersTableAwaiting => 'Awaiting';

  @override
  String get customerOrdersTableRequiresAction => 'Requires action';

  @override
  String get customerOrdersTableNA => 'N/A';

  @override
  String get customerOrdersTableFulfilled => 'Fulfilled';

  @override
  String get customerOrdersTableShipped => 'Shipped';

  @override
  String get customerOrdersTableNotFulfilled => 'Not fulfilled';

  @override
  String get customerOrdersTablePartiallyFulfilled => 'Partially fulfilled';

  @override
  String get customerOrdersTablePartiallyShipped => 'Partially shipped';

  @override
  String get customerOrdersTableOrder => 'Order';

  @override
  String customerOrdersTableRemainderMore(String remainder) {
    return '+ $remainder more';
  }

  @override
  String get customerOrdersTableDate => 'Date';

  @override
  String get customerOrdersTableFulfillment => 'Fulfillment';

  @override
  String get customerOrdersTableStatus => 'Status';

  @override
  String get customerOrdersTableTotal => 'Total';

  @override
  String get customerTableCustomers => 'Customers';

  @override
  String get customerTableEdit => 'Edit';

  @override
  String get customerTableDetails => 'Details';

  @override
  String get customerTableDateAdded => 'Date added';

  @override
  String get customerTableName => 'Name';

  @override
  String get customerTableEmail => 'Email';

  @override
  String get customerTableOrders => 'Orders';

  @override
  String get promotionFilterDropdownFilters => 'Filters';

  @override
  String get promotionTablePromotions => 'Promotions';

  @override
  String get promotionTableSearchByCodeOrDescription =>
      'Search by code or description...';

  @override
  String get promotionTableSuccess => 'Success';

  @override
  String get promotionTableSuccessfullyCopiedPromotion =>
      'Successfully copied promotion';

  @override
  String get promotionTableError => 'Error';

  @override
  String get promotionTableScheduled => 'Scheduled';

  @override
  String get promotionTableExpired => 'Expired';

  @override
  String get promotionTableActive => 'Active';

  @override
  String get promotionTableDisabled => 'Disabled';

  @override
  String get promotionTableFreeShipping => 'Free Shipping';

  @override
  String get promotionTableCode => 'Code';

  @override
  String get promotionTableDescription => 'Description';

  @override
  String get promotionTableAmount => 'Amount';

  @override
  String get promotionTableStatus => 'Status';

  @override
  String get promotionTableRedemptions => 'Redemptions';

  @override
  String get promotionTableDeletePromotion => 'Delete Promotion';

  @override
  String get promotionTableConfirmDelete =>
      'Are you sure you want to delete this Promotion?';

  @override
  String get promotionTablePublish => 'Publish';

  @override
  String get promotionTableUnpublish => 'Unpublish';

  @override
  String get promotionTableSuccessfullyPublishedPromotion =>
      'Successfully published promotion';

  @override
  String get promotionTableSuccessfullyUnpublishedPromotion =>
      'Successfully unpublished promotion';

  @override
  String get promotionTableDuplicate => 'Duplicate';

  @override
  String get promotionTableDelete => 'Delete';

  @override
  String get draftOrderTableDraftOrders => 'Draft Orders';

  @override
  String get draftOrderTableCompleted => 'Completed';

  @override
  String get draftOrderTableOpen => 'Open';

  @override
  String get draftOrderTableDraft => 'Draft';

  @override
  String get draftOrderTableOrder => 'Order';

  @override
  String get draftOrderTableDateAdded => 'Date added';

  @override
  String get draftOrderTableCustomer => 'Customer';

  @override
  String get draftOrderTableStatus => 'Status';

  @override
  String get giftCardFilterDropdownIsInTheLast => 'is in the last';

  @override
  String get giftCardFilterDropdownIsOlderThan => 'is older than';

  @override
  String get giftCardFilterDropdownIsAfter => 'is after';

  @override
  String get giftCardFilterDropdownIsBefore => 'is before';

  @override
  String get giftCardFilterDropdownIsEqualTo => 'is equal to';

  @override
  String get giftCardFilterDropdownFilters => 'Filters';

  @override
  String get giftCardFilterDropdownStatus => 'Status';

  @override
  String get giftCardFilterDropdownPaymentStatus => 'Payment Status';

  @override
  String get giftCardFilterDropdownFulfillmentStatus => 'Fulfillment Status';

  @override
  String get giftCardFilterDropdownDate => 'Date';

  @override
  String get giftCardTableGiftCards => 'Gift cards';

  @override
  String get giftCardTableCode => 'Code';

  @override
  String get giftCardTableOrder => 'Order';

  @override
  String get giftCardTableOriginalAmount => 'Original Amount';

  @override
  String get giftCardTableBalance => 'Balance';

  @override
  String get giftCardTableRegionHasBeenDeleted => 'Region has been deleted';

  @override
  String get giftCardTableNone => 'None';

  @override
  String get giftCardTableCreated => 'Created';

  @override
  String get imageTableFileName => 'File name';

  @override
  String get imageTableThumbnail => 'Thumbnail';

  @override
  String get imageTableSelectThumbnailImageForProduct =>
      'Select which image you want to use as the thumbnail for this product';

  @override
  String get inventoryTableInventoryItems => 'Inventory Items';

  @override
  String get inventoryTableActionsAdjustAvailability => 'Adjust Availability';

  @override
  String get inventoryTableViewProduct => 'View Product';

  @override
  String get inventoryTableSuccess => 'Success';

  @override
  String get inventoryTableInventoryItemUpdatedSuccessfully =>
      'Inventory item updated successfully';

  @override
  String get inventoryTableAdjustAvailability => 'Adjust availability';

  @override
  String get inventoryTableCancel => 'Cancel';

  @override
  String get inventoryTableSaveAndClose => 'Save and close';

  @override
  String get inventoryTableItem => 'Item';

  @override
  String get inventoryTableVariant => 'Variant';

  @override
  String get inventoryTableSku => 'SKU';

  @override
  String get inventoryTableReserved => 'Reserved';

  @override
  String get inventoryTableInStock => 'In stock';

  @override
  String get orderFilterDropdownFilters => 'Filters';

  @override
  String get orderFilterDropdownStatus => 'Status';

  @override
  String get orderFilterDropdownPaymentStatus => 'Payment Status';

  @override
  String get orderFilterDropdownFulfillmentStatus => 'Fulfillment Status';

  @override
  String get orderFilterDropdownRegions => 'Regions';

  @override
  String get orderFilterDropdownSalesChannel => 'Sales Channel';

  @override
  String get orderFilterDropdownDate => 'Date';

  @override
  String get orderTablePaid => 'Paid';

  @override
  String get orderTableAwaiting => 'Awaiting';

  @override
  String get orderTableRequiresAction => 'Requires action';

  @override
  String get orderTableCanceled => 'Canceled';

  @override
  String get orderTableNA => 'N/A';

  @override
  String get orderTableOrder => 'Order';

  @override
  String get orderTableDateAdded => 'Date added';

  @override
  String get orderTableCustomer => 'Customer';

  @override
  String get orderTableFulfillment => 'Fulfillment';

  @override
  String get orderTablePaymentStatus => 'Payment status';

  @override
  String get orderTableSalesChannel => 'Sales Channel';

  @override
  String get orderTableTotal => 'Total';

  @override
  String get orderTableFiltersComplete => 'Complete';

  @override
  String get orderTableFiltersIncomplete => 'Incomplete';

  @override
  String get priceListTableFilters => 'Filters';

  @override
  String get priceListTableStatus => 'Status';

  @override
  String get priceListTableType => 'Type';

  @override
  String get priceListTablePriceLists => 'Price Lists';

  @override
  String get priceListTableSuccess => 'Success';

  @override
  String get priceListTableSuccessfullyCopiedPriceList =>
      'Successfully copied price list';

  @override
  String get priceListTableError => 'Error';

  @override
  String get priceListTableDeletePriceList => 'Delete Price List';

  @override
  String get priceListTableConfirmDelete =>
      'Are you sure you want to delete this price list?';

  @override
  String get priceListTableSuccessfullyDeletedThePriceList =>
      'Successfully deleted the price list';

  @override
  String get priceListTableSuccessfullyUnpublishedPriceList =>
      'Successfully unpublished price list';

  @override
  String get priceListTableSuccessfullyPublishedPriceList =>
      'Successfully published price list';

  @override
  String get priceListTableUnpublish => 'Unpublish';

  @override
  String get priceListTablePublish => 'Publish';

  @override
  String get priceListTableDelete => 'Delete';

  @override
  String get priceListTableName => 'Name';

  @override
  String get priceListTableDescription => 'Description';

  @override
  String get priceListTableGroups => 'Groups';

  @override
  String priceListTableOtherMore(String other) {
    return '+ $other more';
  }

  @override
  String get priceOverridesApplyOverridesOnSelectedVariants =>
      'Apply overrides on selected variants';

  @override
  String get priceOverridesApplyOnAllVariants => 'Apply on all variants';

  @override
  String get priceOverridesPrices => 'Prices';

  @override
  String get priceOverridesCancel => 'Cancel';

  @override
  String get priceOverridesSaveAndClose => 'Save and close';

  @override
  String get priceOverridesShowRegions => 'Show regions';

  @override
  String get productTableProducts => 'Products';

  @override
  String get productTableCopySuccess => 'Success';

  @override
  String get productTableCopyCreatedANewProduct => 'Created a new product';

  @override
  String get productTableCopyError => 'Error';

  @override
  String get productTableDeleteProduct => 'Delete Product';

  @override
  String get productTableConfirmDelete =>
      'Are you sure you want to delete this product?';

  @override
  String get productTableEdit => 'Edit';

  @override
  String get productTableUnpublish => 'Unpublish';

  @override
  String get productTablePublish => 'Publish';

  @override
  String get productTableDraft => 'draft';

  @override
  String get productTablePublished => 'published';

  @override
  String get productTableSuccess => 'Success';

  @override
  String get productTableSuccessfullyUnpublishedProduct =>
      'Successfully unpublished product';

  @override
  String get productTableSuccessfullyPublishedProduct =>
      'Successfully published product';

  @override
  String get productTableError => 'Error';

  @override
  String get productTableDuplicate => 'Duplicate';

  @override
  String get productTableDelete => 'Delete';

  @override
  String get productTableProposed => 'Proposed';

  @override
  String get productTablePublishedTitle => 'Published';

  @override
  String get productTableRejected => 'Rejected';

  @override
  String get productTableDraftTitle => 'Draft';

  @override
  String get productTableName => 'Name';

  @override
  String get productTableCollection => 'Collection';

  @override
  String get productTableStatus => 'Status';

  @override
  String get productTableAvailability => 'Availability';

  @override
  String get productTableInventory => 'Inventory';

  @override
  String productTableInventoryInStockCountOne(String count) {
    return ' in stock for $count variant(s)';
  }

  @override
  String productTableInventoryInStockCountOther(String count) {
    return ' in stock for $count variant(s)';
  }

  @override
  String get reservationFormLocation => 'Location';

  @override
  String get reservationFormChooseWhereYouWishToReserveFrom =>
      'Choose where you wish to reserve from.';

  @override
  String get reservationFormItemToReserve => 'Item to reserve';

  @override
  String get reservationFormSelectTheItemThatYouWishToReserve =>
      'Select the item that you wish to reserve.';

  @override
  String get reservationFormItem => 'Item';

  @override
  String get reservationFormInStock => 'In stock';

  @override
  String get reservationFormAvailable => 'Available';

  @override
  String get reservationFormReserve => 'Reserve';

  @override
  String get reservationFormRemoveItem => 'Remove item';

  @override
  String get reservationFormDescription => 'Description';

  @override
  String get reservationFormWhatTypeOfReservationIsThis =>
      'What type of reservation is this?';

  @override
  String get reservationsTableReservations => 'Reservations';

  @override
  String get reservationsTableEdit => 'Edit';

  @override
  String get reservationsTableDelete => 'Delete';

  @override
  String get reservationsTableConfirmDelete =>
      'Are you sure you want to remove this reservation?';

  @override
  String get reservationsTableRemoveReservation => 'Remove reservation';

  @override
  String get reservationsTableReservationHasBeenRemoved =>
      'Reservation has been removed';

  @override
  String get newSuccess => 'Success';

  @override
  String get newSuccessfullyCreatedReservation =>
      'Successfully created reservation';

  @override
  String get newError => 'Error';

  @override
  String get newCancel => 'Cancel';

  @override
  String get newSaveReservation => 'Save reservation';

  @override
  String get newReserveItem => 'Reserve Item';

  @override
  String get newMetadata => 'Metadata';

  @override
  String get reservationsTableOrderId => 'Order ID';

  @override
  String get reservationsTableDescription => 'Description';

  @override
  String get reservationsTableCreated => 'Created';

  @override
  String get reservationsTableQuantity => 'Quantity';

  @override
  String get searchModalStartTypingToSearch => 'Start typing to search...';

  @override
  String get searchModalClearSearch => 'Clear search';

  @override
  String get searchModalOr => 'or';

  @override
  String get searchModalToNavigate => 'to navigate';

  @override
  String get searchModalToSelectAnd => 'to select, and';

  @override
  String get searchModalToSearchAnytime => 'to search anytime';

  @override
  String get templatesSettings => 'Settings';

  @override
  String get templatesManageTheSettingsForYourMedusaStore =>
      'Manage the settings for your Medusa store';

  @override
  String get transferOrdersModalInfo => 'Info';

  @override
  String get transferOrdersModalCustomerIsAlreadyTheOwnerOfTheOrder =>
      'Customer is already the owner of the order';

  @override
  String get transferOrdersModalSuccess => 'Success';

  @override
  String
      get transferOrdersModalSuccessfullyTransferredOrderToDifferentCustomer =>
          'Successfully transferred order to different customer';

  @override
  String get transferOrdersModalError => 'Error';

  @override
  String get transferOrdersModalCouldNotTransferOrderToDifferentCustomer =>
      'Could not transfer order to different customer';

  @override
  String get transferOrdersModalTransferOrder => 'Transfer order';

  @override
  String get transferOrdersModalOrder => 'Order';

  @override
  String get transferOrdersModalCurrentOwner => 'Current Owner';

  @override
  String get transferOrdersModalTheCustomerCurrentlyRelatedToThisOrder =>
      'The customer currently related to this order';

  @override
  String get transferOrdersModalNewOwner => 'New Owner';

  @override
  String get transferOrdersModalTheCustomerToTransferThisOrderTo =>
      'The customer to transfer this order to';

  @override
  String get transferOrdersModalCancel => 'Cancel';

  @override
  String get transferOrdersModalConfirm => 'Confirm';

  @override
  String get templatesEditUser => 'Edit User';

  @override
  String get templatesRemoveUser => 'Remove User';

  @override
  String get templatesResendInvitation => 'Resend Invitation';

  @override
  String get templatesSuccess => 'Success';

  @override
  String get templatesInvitiationLinkHasBeenResent =>
      'Invitation link has been resent';

  @override
  String get templatesCopyInviteLink => 'Copy invite link';

  @override
  String get templatesInviteLinkCopiedToClipboard =>
      'Invite link copied to clipboard';

  @override
  String get templatesRemoveInvitation => 'Remove Invitation';

  @override
  String get templatesExpired => 'Expired';

  @override
  String get templatesPending => 'Pending';

  @override
  String get templatesAll => 'All';

  @override
  String get templatesMember => 'Member';

  @override
  String get templatesAdmin => 'Admin';

  @override
  String get templatesNoTeamPermissions => 'No team permissions';

  @override
  String get templatesStatus => 'Status';

  @override
  String get templatesActive => 'Active';

  @override
  String get templatesName => 'Name';

  @override
  String get templatesEmail => 'Email';

  @override
  String get templatesTeamPermissions => 'Team permissions';

  @override
  String get templatesConfirmRemove =>
      'Are you sure you want to remove this user?';

  @override
  String get templatesRemoveUserHeading => 'Remove user';

  @override
  String get templatesUserHasBeenRemoved => 'User has been removed';

  @override
  String get templatesConfirmRemoveInvite =>
      'Are you sure you want to remove this invite?';

  @override
  String get templatesRemoveInvite => 'Remove invite';

  @override
  String get templatesInvitiationHasBeenRemoved =>
      'Invitation has been removed';

  @override
  String get multiselectChooseCategories => 'Choose categories';

  @override
  String domainCategoriesMultiselectSelectedWithCountsOne(String count) {
    return '$count';
  }

  @override
  String domainCategoriesMultiselectSelectedWithCountsOther(String count) {
    return '$count';
  }

  @override
  String get detailsSuccess => 'Success';

  @override
  String get detailsUpdatedProductsInCollection =>
      'Updated products in collection';

  @override
  String get detailsError => 'Error';

  @override
  String get detailsBackToCollections => 'Back to Collections';

  @override
  String get detailsEditCollection => 'Edit Collection';

  @override
  String get detailsDelete => 'Delete';

  @override
  String get detailsMetadata => 'Metadata';

  @override
  String get detailsEditProducts => 'Edit Products';

  @override
  String get detailsProductsInThisCollection => 'Products in this collection';

  @override
  String get detailsRawCollection => 'Raw collection';

  @override
  String get detailsDeleteCollection => 'Delete collection';

  @override
  String get detailsSuccessfullyDeletedCollection =>
      'Successfully deleted collection';

  @override
  String get detailsYesDelete => 'Yes, delete';

  @override
  String get detailsSuccessfullyUpdatedCustomer =>
      'Successfully updated customer';

  @override
  String get detailsCustomerDetails => 'Customer Details';

  @override
  String get detailsGeneral => 'General';

  @override
  String get detailsFirstName => 'First Name';

  @override
  String get detailsLebron => 'Lebron';

  @override
  String get detailsLastName => 'Last Name';

  @override
  String get detailsJames => 'James';

  @override
  String get detailsEmail => 'Email';

  @override
  String get detailsPhoneNumber => 'Phone number';

  @override
  String get detailsCancel => 'Cancel';

  @override
  String get detailsSaveAndClose => 'Save and close';

  @override
  String get detailsEdit => 'Edit';

  @override
  String get detailsBackToCustomers => 'Back to Customers';

  @override
  String get detailsFirstSeen => 'First seen';

  @override
  String get detailsPhone => 'Phone';

  @override
  String get detailsOrders => 'Orders';

  @override
  String get detailsUser => 'User';

  @override
  String detailsOrdersOne(String count) {
    return 'Orders $count';
  }

  @override
  String detailsOrdersOther(String count) {
    return 'Orders count';
  }

  @override
  String get detailsAnOverviewOfCustomerOrders =>
      'An overview of Customer Orders';

  @override
  String get detailsRawCustomer => 'Raw customer';

  @override
  String get groupsGroupUpdated => 'Group Updated';

  @override
  String get groupsGroupCreated => 'Group Created';

  @override
  String get groupsTheCustomerGroupHasBeenUpdated =>
      'The customer group has been updated';

  @override
  String get groupsTheCustomerGroupHasBeenCreated =>
      'The customer group has been created';

  @override
  String get groupsEditCustomerGroup => 'Edit Customer Group';

  @override
  String get groupsCreateANewCustomerGroup => 'Create a New Customer Group';

  @override
  String get groupsDetails => 'Details';

  @override
  String get groupsMetadata => 'Metadata';

  @override
  String get groupsCancel => 'Cancel';

  @override
  String get groupsEditGroup => 'Edit Group';

  @override
  String get groupsPublishGroup => 'Publish Group';

  @override
  String get groupsNoCustomersInThisGroupYet =>
      'No customers in this group yet';

  @override
  String get groupsCustomers => 'Customers';

  @override
  String get groupsEdit => 'Edit';

  @override
  String get groupsDelete => 'Delete';

  @override
  String get groupsYesDelete => 'Yes, delete';

  @override
  String get groupsDeleteTheGroup => 'Delete the group';

  @override
  String get groupsGroupDeleted => 'Group deleted';

  @override
  String get groupsConfirmDeleteCustomerGroup =>
      'Are you sure you want to delete this customer group?';

  @override
  String get groupsBackToCustomerGroups => 'Back to customer groups';

  @override
  String get groupsNewGroup => 'New group';

  @override
  String get addConditionConditionsWereSuccessfullyAdded =>
      'Conditions were successfully added';

  @override
  String get addConditionPromotionConditionsUpdated =>
      'Promotion conditions updated';

  @override
  String get addConditionUseConditionsMustBeUsedWithinAConditionsProvider =>
      'useConditions must be used within a ConditionsProvider';

  @override
  String get collectionsSearch => 'Search...';

  @override
  String get collectionsCancel => 'Cancel';

  @override
  String get collectionsSaveAndGoBack => 'Save and go back';

  @override
  String get collectionsSaveAndClose => 'Save and close';

  @override
  String get customerGroupsSearch => 'Search...';

  @override
  String get customerGroupsCancel => 'Cancel';

  @override
  String get customerGroupsSaveAndGoBack => 'Save and go back';

  @override
  String get customerGroupsSaveAndClose => 'Save and close';

  @override
  String get productTypesSearch => 'Search...';

  @override
  String get productTypesCancel => 'Cancel';

  @override
  String get productTypesSaveAndGoBack => 'Save and go back';

  @override
  String get productTypesSaveAndClose => 'Save and close';

  @override
  String get productsSearch => 'Search...';

  @override
  String get productsCancel => 'Cancel';

  @override
  String get productsSaveAndGoBack => 'Save and go back';

  @override
  String get productsSaveAndClose => 'Save and close';

  @override
  String get tagsSearch => 'Search...';

  @override
  String get tagsCancel => 'Cancel';

  @override
  String get tagsSaveAndGoBack => 'Save and go back';

  @override
  String get tagsSaveAndClose => 'Save and close';

  @override
  String get editConditionAddConditions => 'Add conditions';

  @override
  String editConditionSelectedWithCountOne(String count) {
    return '$count';
  }

  @override
  String editConditionSelectedWithCountOther(String count) {
    return '$count';
  }

  @override
  String get editConditionDeselect => 'Deselect';

  @override
  String get editConditionRemove => 'Remove';

  @override
  String get editConditionAdd => 'Add';

  @override
  String editConditionTitle(String type) {
    return 'Edit $type in Promotion Condition';
  }

  @override
  String get editConditionClose => 'Close';

  @override
  String get editConditionSuccess => 'Success';

  @override
  String get editConditionTheResourcesWereSuccessfullyAdded =>
      'The resources were successfully added';

  @override
  String get editConditionError => 'Error';

  @override
  String get editConditionFailedToAddResources => 'Failed to add resources';

  @override
  String get editConditionTheResourcesWereSuccessfullyRemoved =>
      'The resources were successfully removed';

  @override
  String get editConditionFailedToRemoveResources =>
      'Failed to remove resources';

  @override
  String
      get editConditionUseEditConditionContextMustBeUsedWithinAnEditConditionProvider =>
          'useEditConditionContext must be used within an EditConditionProvider';

  @override
  String get conditionsConditions => 'Conditions';

  @override
  String get conditionsAddConditionLabel => 'Add condition';

  @override
  String get conditionsThisPromotionHasNoConditions =>
      'This promotion has no conditions';

  @override
  String get conditionsSuccess => 'Success';

  @override
  String get conditionsConditionRemoved => 'Condition removed';

  @override
  String get conditionsError => 'Error';

  @override
  String get conditionsEditCondition => 'Edit condition';

  @override
  String get conditionsDeleteCondition => 'Delete condition';

  @override
  String get conditionsPromotionIsApplicableToSpecificProducts =>
      'Promotion is applicable to specific products';

  @override
  String get conditionsPromotionIsApplicableToSpecificCollections =>
      'Promotion is applicable to specific collections';

  @override
  String get conditionsPromotionIsApplicableToSpecificProductTags =>
      'Promotion is applicable to specific product tags';

  @override
  String get conditionsPromotionIsApplicableToSpecificProductTypes =>
      'Promotion is applicable to specific product types';

  @override
  String get conditionsPromotionIsApplicableToSpecificCustomerGroups =>
      'Promotion is applicable to specific customer groups';

  @override
  String get configurationsSuccess => 'Success';

  @override
  String get configurationsPromotionUpdatedSuccessfully =>
      'Promotion updated successfully';

  @override
  String get configurationsError => 'Error';

  @override
  String get configurationsEditConfigurations => 'Edit configurations';

  @override
  String get configurationsCancel => 'Cancel';

  @override
  String get configurationsSave => 'Save';

  @override
  String get configurationsConfigurations => 'Configurations';

  @override
  String get configurationsStartDate => 'Start date';

  @override
  String get configurationsEndDate => 'End date';

  @override
  String get configurationsDeleteConfiguration => 'Delete configuration';

  @override
  String get configurationsPromotionEndDateRemoved =>
      'Promotion end date removed';

  @override
  String get configurationsNumberOfRedemptions => 'Number of redemptions';

  @override
  String get configurationsRedemptionLimitRemoved => 'Redemption limit removed';

  @override
  String get configurationsDeleteSetting => 'Delete setting';

  @override
  String get configurationsPromotionDurationRemoved =>
      'Promotion duration removed';

  @override
  String get generalSuccess => 'Success';

  @override
  String get generalPromotionUpdatedSuccessfully =>
      'Promotion updated successfully';

  @override
  String get generalError => 'Error';

  @override
  String get generalEditGeneralInformation => 'Edit general information';

  @override
  String get generalDetails => 'Details';

  @override
  String get generalMetadata => 'Metadata';

  @override
  String get generalCancel => 'Cancel';

  @override
  String get generalSaveAndClose => 'Save and close';

  @override
  String get generalDeletePromotion => 'Delete promotion';

  @override
  String get generalConfirmDeletePromotion =>
      'Are you sure you want to delete this promotion?';

  @override
  String get generalPromotionDeletedSuccessfully =>
      'Promotion deleted successfully';

  @override
  String get generalPromotionPublishedSuccessfully =>
      'Promotion published successfully';

  @override
  String get generalPromotionDraftedSuccessfully =>
      'Promotion drafted successfully';

  @override
  String get generalTemplatePromotion => 'Template promotion';

  @override
  String get generalPublished => 'Published';

  @override
  String get generalDraft => 'Draft';

  @override
  String get generalPromotionAmount => 'Promotion Amount';

  @override
  String get generalValidRegions => 'Valid Regions';

  @override
  String get generalTotalRedemptions => 'Total Redemptions';

  @override
  String get generalFreeShipping => 'FREE SHIPPING';

  @override
  String get generalUnknownPromotionType => 'Unknown promotion type';

  @override
  String get detailsPromotionDeleted => 'Promotion deleted';

  @override
  String get detailsConfirmDeletePromotion =>
      'Are you sure you want to delete this promotion?';

  @override
  String get detailsDeletePromotion => 'Delete promotion';

  @override
  String get detailsBackToPromotions => 'Back to Promotions';

  @override
  String get detailsRawPromotion => 'Raw promotion';

  @override
  String get promotionsAddPromotion => 'Add Promotion';

  @override
  String get promotionFormAddConditions => 'Add Conditions';

  @override
  String get promotionFormChooseAConditionType => 'Choose a condition type';

  @override
  String get promotionFormYouCanOnlyAddOneOfEachTypeOfCondition =>
      'You can only add one of each type of condition';

  @override
  String get promotionFormYouCannotAddAnyMoreConditions =>
      'You cannot add any more conditions';

  @override
  String get promotionFormCancel => 'Cancel';

  @override
  String get promotionFormSave => 'Save';

  @override
  String get addConditionTablesCancel => 'Cancel';

  @override
  String get addConditionTablesSaveAndAddMore => 'Save and add more';

  @override
  String get addConditionTablesSaveAndClose => 'Save and close';

  @override
  String get addConditionTablesSearchByTitle => 'Search by title...';

  @override
  String get addConditionTablesSearchGroups => 'Search groups...';

  @override
  String get addConditionTablesSearchProducts => 'Search products...';

  @override
  String get addConditionTablesSearchByTag => 'Search by tag...';

  @override
  String get addConditionTablesSearchByType => 'Search by type...';

  @override
  String get detailsConditionTablesSearchByTitle => 'Search by title...';

  @override
  String get detailsConditionTablesSearchGroups => 'Search groups...';

  @override
  String get detailsConditionTablesCancel => 'Cancel';

  @override
  String get detailsConditionTablesSaveAndAddMore => 'Save and add more';

  @override
  String get detailsConditionTablesSaveAndClose => 'Save and close';

  @override
  String get detailsConditionTablesSearchProducts => 'Search products...';

  @override
  String get detailsConditionTablesSearchByTag => 'Search by tag...';

  @override
  String get detailsConditionTablesSearchByType => 'Search by type...';

  @override
  String get editConditionTablesSearchByTitle => 'Search by title...';

  @override
  String get editConditionTablesTitle => 'Title';

  @override
  String get editConditionTablesSearchGroups => 'Search groups...';

  @override
  String get editConditionTablesCancel => 'Cancel';

  @override
  String get editConditionTablesDeleteCondition => 'Delete condition';

  @override
  String get editConditionTablesSave => 'Save';

  @override
  String get editConditionTablesSearchProducts => 'Search products...';

  @override
  String get editConditionTablesSearchByTag => 'Search by tag...';

  @override
  String get editConditionTablesSearchByType => 'Search by type...';

  @override
  String get sharedTitle => 'Title';

  @override
  String get sharedProducts => 'Products';

  @override
  String get sharedAppliesToTheSelectedItems =>
      'Applies to the selected items.';

  @override
  String get sharedAppliesToAllItemsExceptTheSelectedItems =>
      'Applies to all items except the selected items.';

  @override
  String get sharedMembers => 'Members';

  @override
  String get sharedStatus => 'Status';

  @override
  String get sharedVariants => 'Variants';

  @override
  String get sharedTag => 'Tag';

  @override
  String get sharedType => 'Type';

  @override
  String editConditionsModalTitle(String title) {
    return 'Edit $title';
  }

  @override
  String get formUsePromotionFormMustBeAChildOfPromotionFormContext =>
      'usePromotionForm must be a child of PromotionFormContext';

  @override
  String get promotionFormError => 'Error';

  @override
  String get promotionFormSaveAsDraft => 'Save as draft';

  @override
  String get promotionFormPublishPromotion => 'Publish promotion';

  @override
  String get promotionFormCreateNewPromotion => 'Create new promotion';

  @override
  String get promotionFormPromotionType => 'Promotion type';

  @override
  String get promotionFormSelectAPromotionType => 'Select a promotion type';

  @override
  String get promotionFormAllocation => 'Allocation';

  @override
  String get promotionFormGeneral => 'General';

  @override
  String get promotionFormConfiguration => 'Configuration';

  @override
  String get promotionFormPromotionCodeApplicationDisclaimer =>
      'Promotion code applies from when you hit the publish button and forever if left untouched.';

  @override
  String get promotionFormConditions => 'Conditions';

  @override
  String get promotionFormPromotionCodeApplyToAllProductsIfLeftUntouched =>
      'Promotion code apply to all products if left untouched.';

  @override
  String get promotionFormAddConditionsToYourPromotion =>
      'Add conditions to your Promotion';

  @override
  String get promotionFormMetadata => 'Metadata';

  @override
  String get promotionFormMetadataUsageDescription =>
      'Metadata allows you to add additional information to your promotion.';

  @override
  String conditionItemRemainderMore(String remainder) {
    return '+remainder more';
  }

  @override
  String get conditionsEdit => 'Edit';

  @override
  String get conditionsProduct => 'Product';

  @override
  String get conditionsCollection => 'Collection';

  @override
  String get conditionsTag => 'Tag';

  @override
  String get conditionsCustomerGroup => 'Customer group';

  @override
  String get conditionsType => 'Type';

  @override
  String get conditionsAddCondition => 'Add Condition';

  @override
  String get sectionsStartDate => 'Start date';

  @override
  String get sectionsScheduleThePromotionToActivateInTheFuture =>
      'Schedule the promotion to activate in the future.';

  @override
  String get sectionsSelectPromotionStartDate =>
      'If you want to schedule the promotion to activate in the future, you can set a start date here, otherwise the promotion will be active immediately.';

  @override
  String get sectionsStartTime => 'Start time';

  @override
  String get sectionsPromotionHasAnExpiryDate =>
      'Promotion has an expiry date?';

  @override
  String get sectionsScheduleThePromotionToDeactivateInTheFuture =>
      'Schedule the promotion to deactivate in the future.';

  @override
  String get sectionsSelectPromotionEndDate =>
      'If you want to schedule the promotion to deactivate in the future, you can set an expiry date here.';

  @override
  String get sectionsExpiryDate => 'Expiry date';

  @override
  String get sectionsExpiryTime => 'Expiry time';

  @override
  String get sectionsLimitTheNumberOfRedemptions =>
      'Limit the number of redemptions?';

  @override
  String get sectionsLimitAppliesAcrossAllCustomersNotPerCustomer =>
      'Limit applies across all customers, not per customer.';

  @override
  String get sectionsLimitPromotionNumberOfUses =>
      'If you wish to limit the amount of times a customer can redeem this promotion, you can set a limit here.';

  @override
  String get sectionsNumberOfRedemptions => 'Number of redemptions';

  @override
  String get sectionsAvailabilityDuration => 'Availability duration?';

  @override
  String get sectionsSetTheDurationOfThePromotion =>
      'Set the duration of the promotion.';

  @override
  String get sectionsSelectAPromotionType => 'Select a promotion type';

  @override
  String get sectionsTotalAmount => 'Total amount';

  @override
  String get sectionsApplyToTheTotalAmount => 'Apply to the total amount';

  @override
  String get sectionsItemSpecific => 'Item specific';

  @override
  String get sectionsApplyToEveryAllowedItem => 'Apply to every allowed item';

  @override
  String get sectionsPercentage => 'Percentage';

  @override
  String get sectionsFixedAmount => 'Fixed amount';

  @override
  String get sectionsPromotionInWholeNumbers => 'Promotion in whole numbers';

  @override
  String get sectionsYouCanOnlySelectOneValidRegionIfYouWantToUseTheFixedAmountType =>
      'You can only select one valid region if you want to use the fixed amount type';

  @override
  String get sectionsFreeShipping => 'Free shipping';

  @override
  String get sectionsOverrideDeliveryAmount => 'Override delivery amount';

  @override
  String get sectionsAtLeastOneRegionIsRequired =>
      'At least one region is required';

  @override
  String get sectionsChooseValidRegions => 'Choose valid regions';

  @override
  String get sectionsCode => 'Code';

  @override
  String get sectionsSummersale10 => 'SUMMERSALE10';

  @override
  String get sectionsCodeIsRequired => 'Code is required';

  @override
  String get sectionsAmountIsRequired => 'Amount is required';

  @override
  String get sectionsAmount => 'Amount';

  @override
  String get sectionsCustomerInvoiceCode =>
      'The code your customers will enter during checkout. This will appear on your customer’s invoice.';

  @override
  String get sectionsUppercaseLettersAndNumbersOnly =>
      'Uppercase letters and numbers only.';

  @override
  String get sectionsDescription => 'Description';

  @override
  String get sectionsSummerSale2022 => 'Summer Sale 2022';

  @override
  String get sectionsThisIsATemplatePromotion => 'This is a template promotion';

  @override
  String get sectionsTemplatePromotionsDescription =>
      'Template promotions allow you to define a set of rules that can be used across a group of promotions. This is useful in campaigns that should generate unique codes for each user, but where the rules for all unique codes should be the same.';

  @override
  String get promotionFormProduct => 'Product';

  @override
  String get promotionFormOnlyForSpecificProducts =>
      'Only for specific products';

  @override
  String get promotionFormChooseProducts => 'Choose products';

  @override
  String get promotionFormCustomerGroup => 'Customer group';

  @override
  String get promotionFormOnlyForSpecificCustomerGroups =>
      'Only for specific customer groups';

  @override
  String get promotionFormChooseGroups => 'Choose groups';

  @override
  String get promotionFormTag => 'Tag';

  @override
  String get promotionFormOnlyForSpecificTags => 'Only for specific tags';

  @override
  String get promotionFormCollection => 'Collection';

  @override
  String get promotionFormOnlyForSpecificProductCollections =>
      'Only for specific product collections';

  @override
  String get promotionFormChooseCollections => 'Choose collections';

  @override
  String get promotionFormType => 'Type';

  @override
  String get promotionFormOnlyForSpecificProductTypes =>
      'Only for specific product types';

  @override
  String get promotionFormChooseTypes => 'Choose types';

  @override
  String get utilsProducts => 'products';

  @override
  String get utilsGroups => 'groups';

  @override
  String get utilsTags => 'tags';

  @override
  String get utilsCollections => 'collections';

  @override
  String get utilsTypes => 'types';

  @override
  String get giftCardsCreatedGiftCard => 'Created gift card';

  @override
  String get giftCardsCustomGiftCardWasCreatedSuccessfully =>
      'Custom gift card was created successfully';

  @override
  String get giftCardsError => 'Error';

  @override
  String get giftCardsCustomGiftCard => 'Custom Gift Card';

  @override
  String get giftCardsDetails => 'Details';

  @override
  String get giftCardsReceiver => 'Receiver';

  @override
  String get giftCardsCancel => 'Cancel';

  @override
  String get giftCardsCreateAndSend => 'Create and send';

  @override
  String get detailsUpdatedGiftCard => 'Updated Gift card';

  @override
  String get detailsGiftCardWasSuccessfullyUpdated =>
      'Gift card was successfully updated';

  @override
  String get detailsFailedToUpdateGiftCard => 'Failed to update Gift card';

  @override
  String get detailsEditGiftCard => 'Edit Gift Card';

  @override
  String get detailsDetails => 'Details';

  @override
  String get detailsEditDetails => 'Edit details';

  @override
  String get detailsUpdateBalanceLabel => 'Update balance';

  @override
  String get detailsUpdatedStatus => 'Updated status';

  @override
  String get detailsSuccessfullyUpdatedTheStatusOfTheGiftCard =>
      'Successfully updated the status of the Gift Card';

  @override
  String get detailsBackToGiftCards => 'Back to Gift Cards';

  @override
  String get detailsOriginalAmount => 'Original amount';

  @override
  String get detailsBalance => 'Balance';

  @override
  String get detailsRegion => 'Region';

  @override
  String get detailsExpiresOn => 'Expires on';

  @override
  String get detailsCreated => 'Created';

  @override
  String get detailsRawGiftCard => 'Raw gift card';

  @override
  String get detailsBalanceUpdated => 'Balance updated';

  @override
  String get detailsGiftCardBalanceWasUpdated =>
      'Gift card balance was updated';

  @override
  String get detailsFailedToUpdateBalance => 'Failed to update balance';

  @override
  String get detailsUpdateBalance => 'Update Balance';

  @override
  String get manageBackToGiftCards => 'Back to Gift Cards';

  @override
  String get giftCardsPleaseEnterANameForTheGiftCard =>
      'Please enter a name for the Gift Card';

  @override
  String get giftCardsPleaseAddAtLeastOneDenomination =>
      'Please add at least one denomination';

  @override
  String get giftCardsDenominations => 'Denominations';

  @override
  String get giftCardsSuccess => 'Success';

  @override
  String get giftCardsSuccessfullyCreatedGiftCard =>
      'Successfully created Gift Card';

  @override
  String get giftCardsCreateGiftCard => 'Create Gift Card';

  @override
  String get giftCardsGiftCardDetails => 'Gift Card Details';

  @override
  String get giftCardsName => 'Name';

  @override
  String get giftCardsTheBestGiftCard => 'The best Gift Card';

  @override
  String get giftCardsDescription => 'Description';

  @override
  String get giftCardsTheBestGiftCardOfAllTime =>
      'The best Gift Card of all time';

  @override
  String get giftCardsThumbnail => 'Thumbnail';

  @override
  String get giftCardsDelete => 'Delete';

  @override
  String get giftCardsSizeRecommended =>
      '1200 x 1600 (3:4) recommended, up to 10MB each';

  @override
  String get giftCardsAmount => 'Amount';

  @override
  String get giftCardsAddDenomination => 'Add Denomination';

  @override
  String get giftCardsCreatePublish => 'Create & Publish';

  @override
  String get giftCardsSuccessfullyUpdatedGiftCard =>
      'Successfully updated Gift Card';

  @override
  String get giftCardsGiftCards => 'Gift Cards';

  @override
  String get giftCardsManage => 'Manage the Gift Cards of your Medusa store';

  @override
  String get giftCardsAreYouReadyToSellYourFirstGiftCard =>
      'Are you ready to sell your first Gift Card?';

  @override
  String get giftCardsNoGiftCardHasBeenAddedYet =>
      'No Gift Card has been added yet.';

  @override
  String get giftCardsHistory => 'History';

  @override
  String get giftCardsSeeTheHistoryOfPurchasedGiftCards =>
      'See the history of purchased Gift Cards';

  @override
  String get giftCardsSuccessfullyDeletedGiftCard =>
      'Successfully deleted Gift Card';

  @override
  String get giftCardsYesDelete => 'Yes, delete';

  @override
  String get giftCardsDeleteGiftCard => 'Delete Gift Card';

  @override
  String get inventoryFilters => 'Filters';

  @override
  String get addressFormAddress => 'Address';

  @override
  String get addressFormCompany => 'Company';

  @override
  String get addressFormAddress1 => 'Address 1';

  @override
  String get addressFormThisFieldIsRequired => 'This field is required';

  @override
  String get addressFormAddress2 => 'Address 2';

  @override
  String get addressFormPostalCode => 'Postal code';

  @override
  String get addressFormCity => 'City';

  @override
  String get addressFormCountry => 'Country';

  @override
  String get editSalesChannelsEditChannels => 'Edit channels';

  @override
  String get editSalesChannelsAddChannels => 'Add channels';

  @override
  String get generalFormLocationName => 'Location name';

  @override
  String get generalFormFlagshipStoreWarehouse => 'Flagship store, warehouse';

  @override
  String get generalFormNameIsRequired => 'Name is required';

  @override
  String get locationCardDeleteLocation => 'Delete Location';

  @override
  String get locationCardConfirmDelete =>
      'Are you sure you want to delete this location. This will also delete all inventory levels and reservations associated with this location.';

  @override
  String get locationCardSuccess => 'Success';

  @override
  String get locationCardLocationDeletedSuccessfully =>
      'Location deleted successfully';

  @override
  String get locationCardError => 'Error';

  @override
  String get locationCardEditDetails => 'Edit details';

  @override
  String get locationCardDelete => 'Delete';

  @override
  String get locationCardConnectedSalesChannels => 'Connected sales channels';

  @override
  String get salesChannelsFormAddSalesChannels => 'Add sales channels';

  @override
  String get salesChannelsFormEditChannels => 'Edit channels';

  @override
  String get salesChannelsSectionNotConnectedToAnySalesChannelsYet =>
      'Not connected to any sales channels yet';

  @override
  String get editSuccess => 'Success';

  @override
  String get editLocationEditedSuccessfully => 'Location edited successfully';

  @override
  String get editError => 'Error';

  @override
  String get editEditLocationDetails => 'Edit Location Details';

  @override
  String get editMetadata => 'Metadata';

  @override
  String get editCancel => 'Cancel';

  @override
  String get editSaveAndClose => 'Save and close';

  @override
  String get newLocationAddedSuccessfully => 'Location added successfully';

  @override
  String get newLocationCreated =>
      'Location was created successfully, but there was an error associating sales channels';

  @override
  String get newCancelLocationChanges =>
      'Are you sure you want to cancel with unsaved changes';

  @override
  String get newYesCancel => 'Yes, cancel';

  @override
  String get newNoContinueCreating => 'No, continue creating';

  @override
  String get newAddLocation => 'Add location';

  @override
  String get newAddNewLocation => 'Add new location';

  @override
  String get newGeneralInformation => 'General Information';

  @override
  String get newLocationDetails => 'Specify the details about this location';

  @override
  String get newSelectLocationChannel =>
      'Specify which Sales Channels this location\'s items can be purchased through.';

  @override
  String get oauthCompleteInstallation => 'Complete Installation';

  @override
  String get claimTypeFormRefund => 'Refund';

  @override
  String get claimTypeFormReplace => 'Replace';

  @override
  String get itemsToReceiveFormItemsToReceive => 'Items to receive';

  @override
  String get itemsToReceiveFormProduct => 'Product';

  @override
  String get itemsToReceiveFormQuantity => 'Quantity';

  @override
  String get itemsToReceiveFormRefundable => 'Refundable';

  @override
  String get addReturnReasonReasonForReturn => 'Reason for Return';

  @override
  String get addReturnReasonReason => 'Reason';

  @override
  String get addReturnReasonChooseAReturnReason => 'Choose a return reason';

  @override
  String get addReturnReasonNote => 'Note';

  @override
  String get addReturnReasonProductWasDamagedDuringShipping =>
      'Product was damaged during shipping';

  @override
  String get addReturnReasonCancel => 'Cancel';

  @override
  String get addReturnReasonSaveAndGoBack => 'Save and go back';

  @override
  String get addReturnReasonSelectReasonTitle => 'Select Reason';

  @override
  String get addReturnReasonEditReason => 'Edit reason';

  @override
  String get addReturnReasonSelectReason => 'Select reason';

  @override
  String get itemsToReturnFormItemsToClaim => 'Items to claim';

  @override
  String get itemsToReturnFormItemsToReturn => 'Items to return';

  @override
  String get itemsToReturnFormProduct => 'Product';

  @override
  String get itemsToReturnFormQuantity => 'Quantity';

  @override
  String get itemsToReturnFormRefundable => 'Refundable';

  @override
  String get addAdditionalItemsScreenGoBack => 'Go back';

  @override
  String get addAdditionalItemsScreenAddProducts => 'Add products';

  @override
  String get addAdditionalItemsScreenAddProductVariants =>
      'Add Product Variants';

  @override
  String get addAdditionalItemsScreenSearchProducts => 'Search products';

  @override
  String get addAdditionalItemsScreenVariantPriceMissing =>
      'This variant does not have a price for the region/currency of this order, and cannot be selected.';

  @override
  String get addAdditionalItemsScreenStock => 'Stock';

  @override
  String get addAdditionalItemsScreenPrice => 'Price';

  @override
  String get addAdditionalItemsScreenPriceOverriddenInPriceListApplicableToThisOrder =>
      'The price has been overridden in a price list, that is applicable to this order.';

  @override
  String get itemsToSendFormItemsToSend => 'Items to send';

  @override
  String get itemsToSendFormAddProducts => 'Add products';

  @override
  String get itemsToSendFormProduct => 'Product';

  @override
  String get itemsToSendFormQuantity => 'Quantity';

  @override
  String get itemsToSendFormPrice => 'Price';

  @override
  String get itemsToSendFormPriceOverriddenInPriceListApplicableToThisOrder =>
      'The price has been overridden in a price list, that is applicable to this order.';

  @override
  String get refundAmountFormCancelEditingRefundAmount =>
      'Cancel editing refund amount';

  @override
  String get refundAmountFormEditRefundAmount => 'Edit refund amount';

  @override
  String get refundAmountFormRefundAmountCannotBeNegative =>
      'Refund amount cannot be negative';

  @override
  String get refundAmountFormTheRefundAmountMustBeAtLeast0 =>
      'The refund amount must be at least 0';

  @override
  String reservationIndicatorAwaitingReservationCount(
      String awaitingReservation) {
    return '$awaitingReservation items not reserved';
  }

  @override
  String get reservationIndicatorThisItemHasBeenFulfilled =>
      'This item has been fulfilled.';

  @override
  String editReservationButtonQuantityItemLocationName(String quantity) {
    return '$quantity item: ';
  }

  @override
  String get reservationIndicatorEditReservation => 'Edit reservation';

  @override
  String get rmaSummariesClaimedItems => 'Claimed items';

  @override
  String get rmaSummariesReplacementItems => 'Replacement items';

  @override
  String get rmaSummariesCustomerRefundDescription =>
      'The customer will receive a full refund for the claimed items, as the cost of replacement items and shipping will not be deducted. Alternatively, you can choose to set a custom refund amount when you receive the returned items or create an exchange instead.';

  @override
  String get rmaSummariesRefundAmount => 'Refund amount';

  @override
  String
      get rmaSummariesTheCustomerWillBeRefundedOnceTheReturnedItemsAreReceived =>
          'The customer will be refunded once the returned items are received';

  @override
  String get rmaSummariesTheCustomerWillBeRefundedImmediately =>
      'The customer will be refunded immediately';

  @override
  String get rmaSummariesReceiving => 'Receiving';

  @override
  String get rmaSummariesFree => 'Free';

  @override
  String get sendNotificationFormReturn => 'return';

  @override
  String get sendNotificationFormExchange => 'exchange';

  @override
  String get sendNotificationFormClaim => 'claim';

  @override
  String get sendNotificationFormSendNotifications => 'Send notifications';

  @override
  String get sendNotificationFormIfUncheckedTheCustomerWillNotReceiveCommunication =>
      'If unchecked the customer will not receive communication about this subject.';

  @override
  String get shippingAddressFormShippingAddress => 'Shipping address';

  @override
  String get shippingAddressFormShipToADifferentAddress =>
      'Ship to a different address';

  @override
  String get shippingAddressFormCancel => 'Cancel';

  @override
  String get shippingAddressFormSaveAndGoBack => 'Save and go back';

  @override
  String get shippingAddressFormShippingInformation => 'Shipping Information';

  @override
  String get shippingFormShippingForReturnItems => 'Shipping for return items';

  @override
  String get shippingFormShippingForReplacementItems =>
      'Shipping for replacement items';

  @override
  String get shippingFormShippingMethodIsRequired =>
      'Shipping method is required';

  @override
  String get shippingFormChooseShippingMethod => 'Choose shipping method';

  @override
  String get shippingFormShippingMethod => 'Shipping method';

  @override
  String get shippingFormAddCustomPrice => 'Add custom price';

  @override
  String
      get shippingFormReturnShippingForItemsClaimedByTheCustomerIsComplimentary =>
          'Return shipping for items claimed by the customer is complimentary.';

  @override
  String get shippingFormShippingForReplacementItemsIsComplimentary =>
      'Shipping for replacement items is complimentary.';

  @override
  String get componentsDecreaseQuantity => 'Decrease quantity';

  @override
  String get componentsIncreaseQuantity => 'Increase quantity';

  @override
  String get detailsSuccessfullyUpdatedAddress =>
      'Successfully updated address';

  @override
  String get detailsBillingAddress => 'Billing Address';

  @override
  String get detailsShippingAddress => 'Shipping Address';

  @override
  String get detailsContact => 'Contact';

  @override
  String get detailsLocation => 'Location';

  @override
  String get claimAreYouSureYouWantToClose => 'Are you sure you want to close?';

  @override
  String get claimYouHaveUnsavedChangesAreYouSureYouWantToClose =>
      'You have unsaved changes, are you sure you want to close?';

  @override
  String get claimPleaseSelectAReason => 'Please select a reason';

  @override
  String get claimAShippingMethodForReplacementItemsIsRequired =>
      'A shipping method for replacement items is required';

  @override
  String get claimSuccessfullyCreatedClaim => 'Successfully created claim';

  @override
  String claimCreated(String displayId, Object display_id) {
    return 'A claim for order #$displayId was successfully created';
  }

  @override
  String get claimErrorCreatingClaim => 'Error creating claim';

  @override
  String get claimCreateClaim => 'Create Claim';

  @override
  String get claimLocation => 'Location';

  @override
  String get claimChooseWhichLocationYouWantToReturnTheItemsTo =>
      'Choose which location you want to return the items to.';

  @override
  String get claimSelectLocationToReturnTo => 'Select Location to Return to';

  @override
  String get claimCancel => 'Cancel';

  @override
  String get claimSubmitAndClose => 'Submit and close';

  @override
  String get createFulfillmentError => 'Error';

  @override
  String get createFulfillmentPleaseSelectALocationToFulfillFrom =>
      'Please select a location to fulfill from';

  @override
  String get createFulfillmentCantAllowThisAction => 'Can\'t allow this action';

  @override
  String get createFulfillmentTryingToFulfillMoreThanInStock =>
      'Trying to fulfill more than in stock';

  @override
  String get createFulfillmentSuccessfullyFulfilledOrder =>
      'Successfully fulfilled order';

  @override
  String get createFulfillmentSuccessfullyFulfilledSwap =>
      'Successfully fulfilled swap';

  @override
  String get createFulfillmentSuccessfullyFulfilledClaim =>
      'Successfully fulfilled claim';

  @override
  String get createFulfillmentSuccess => 'Success';

  @override
  String get createFulfillmentCancel => 'Cancel';

  @override
  String get createFulfillmentCreateFulfillment => 'Create fulfillment';

  @override
  String get createFulfillmentCreateFulfillmentTitle => 'Create Fulfillment';

  @override
  String get createFulfillmentLocations => 'Locations';

  @override
  String get createFulfillmentChooseWhereYouWishToFulfillFrom =>
      'Choose where you wish to fulfill from.';

  @override
  String get createFulfillmentItemsToFulfill => 'Items to fulfill';

  @override
  String get createFulfillmentSelectTheNumberOfItemsThatYouWishToFulfill =>
      'Select the number of items that you wish to fulfill.';

  @override
  String get createFulfillmentSendNotifications => 'Send notifications';

  @override
  String get createFulfillmentWhenToggledNotificationEmailsWillBeSent =>
      'When toggled, notification emails will be sent.';

  @override
  String get createFulfillmentQuantityIsNotValid => 'Quantity is not valid';

  @override
  String get detailCardsAllocated => 'Allocated';

  @override
  String get detailCardsNotFullyAllocated => 'Not fully allocated';

  @override
  String get detailCardsSubtotal => 'Subtotal';

  @override
  String get detailCardsShipping => 'Shipping';

  @override
  String get detailCardsTax => 'Tax';

  @override
  String get detailCardsTotal => 'Total';

  @override
  String get detailCardsEditOrder => 'Edit Order';

  @override
  String get detailCardsAllocate => 'Allocate';

  @override
  String get detailCardsPromotion => 'Promotion:';

  @override
  String get detailCardsOriginalTotal => 'Original Total';

  @override
  String get detailsSuccessfullyUpdatedTheEmailAddress =>
      'Successfully updated the email address';

  @override
  String get detailsEmailAddress => 'Email Address';

  @override
  String get detailsSave => 'Save';

  @override
  String get detailsOrderIdCopied => 'Order ID copied';

  @override
  String get detailsEmailCopied => 'Email copied';

  @override
  String get detailsCancelOrderHeading => 'Cancel order';

  @override
  String get detailsAreYouSureYouWantToCancelTheOrder =>
      'Are you sure you want to cancel the order?';

  @override
  String orderDetailsDisplayId(String displayId, Object display_id) {
    return 'order #$displayId';
  }

  @override
  String get detailsSuccessfullyCanceledOrder => 'Successfully canceled order';

  @override
  String get detailsGoToCustomer => 'Go to Customer';

  @override
  String get detailsTransferOwnership => 'Transfer ownership';

  @override
  String get detailsEditShippingAddress => 'Edit Shipping Address';

  @override
  String get detailsEditBillingAddress => 'Edit Billing Address';

  @override
  String get detailsEditEmailAddress => 'Edit Email Address';

  @override
  String get detailsBackToOrders => 'Back to Orders';

  @override
  String get detailsCancelOrder => 'Cancel Order';

  @override
  String get detailsPayment => 'Payment';

  @override
  String get detailsRefunded => 'Refunded';

  @override
  String get detailsTotalPaid => 'Total Paid';

  @override
  String get detailsFulfillment => 'Fulfillment';

  @override
  String get detailsCreateFulfillment => 'Create Fulfillment';

  @override
  String get detailsShippingMethod => 'Shipping Method';

  @override
  String get detailsCustomer => 'Customer';

  @override
  String get detailsShipping => 'Shipping';

  @override
  String get detailsBilling => 'Billing';

  @override
  String get detailsRawOrder => 'Raw order';

  @override
  String get markShippedSuccessfullyMarkedOrderAsShipped =>
      'Successfully marked order as shipped';

  @override
  String get markShippedSuccessfullyMarkedSwapAsShipped =>
      'Successfully marked swap as shipped';

  @override
  String get markShippedSuccessfullyMarkedClaimAsShipped =>
      'Successfully marked claim as shipped';

  @override
  String get markShippedSuccess => 'Success';

  @override
  String get markShippedError => 'Error';

  @override
  String get markShippedMarkFulfillmentShipped => 'Mark Fulfillment Shipped';

  @override
  String get markShippedTracking => 'Tracking';

  @override
  String get markShippedTrackingNumberLabel => 'Tracking number';

  @override
  String get markShippedTrackingNumber => 'Tracking number...';

  @override
  String get markShippedAddAdditionalTrackingNumber =>
      '+ Add Additional Tracking Number';

  @override
  String get markShippedSendNotifications => 'Send notifications';

  @override
  String get markShippedCancel => 'Cancel';

  @override
  String get markShippedComplete => 'Complete';

  @override
  String get orderLineWarning => 'Warning';

  @override
  String get orderLineCannotDuplicateAnItemWithoutAVariant =>
      'Cannot duplicate an item without a variant';

  @override
  String get orderLineError => 'Error';

  @override
  String get orderLineFailedToDuplicateItem => 'Failed to duplicate item';

  @override
  String get orderLineSuccess => 'Success';

  @override
  String get orderLineItemRemoved => 'Item removed';

  @override
  String get orderLineFailedToRemoveItem => 'Failed to remove item';

  @override
  String get orderLineItemAdded => 'Item added';

  @override
  String get orderLineFailedToReplaceTheItem => 'Failed to replace the item';

  @override
  String get orderLineReplaceProductVariants => 'Replace Product Variants';

  @override
  String get orderLineReplaceWithOtherItem => 'Replace with other item';

  @override
  String get orderLineDuplicateItem => 'Duplicate item';

  @override
  String get orderLineRemoveItem => 'Remove item';

  @override
  String get orderLineLineItemCannotBeEdited =>
      'This line item is part of a fulfillment and cannot be edited. Cancel the fulfillment to edit the line item.';

  @override
  String get orderLineNew => 'New';

  @override
  String get orderLineModified => 'Modified';

  @override
  String get receiveReturnPleaseSelectAtLeastOneItemToReceive =>
      'Please select at least one item to receive';

  @override
  String get receiveReturnSuccessfullyReceivedReturn =>
      'Successfully received return';

  @override
  String receiveReturnReceivedReturnForOrder(String display_id) {
    return 'Received return for order #$display_id';
  }

  @override
  String get receiveReturnFailedToReceiveReturn => 'Failed to receive return';

  @override
  String get receiveReturnReceiveReturn => 'Receive Return';

  @override
  String get receiveReturnLocation => 'Location';

  @override
  String get receiveReturnChooseLocation =>
      'Choose which location you want to return the items to.';

  @override
  String get receiveReturnSelectLocationToReturnTo =>
      'Select Location to Return to';

  @override
  String
      get receiveReturnNoInventoryLevelsExistForTheItemsAtTheSelectedLocation =>
          'No inventory levels exist for the items at the selected location';

  @override
  String get receiveReturnCancel => 'Cancel';

  @override
  String get receiveReturnSaveAndClose => 'Save and close';

  @override
  String get refundSuccess => 'Success';

  @override
  String get refundSuccessfullyRefundedOrder => 'Successfully refunded order';

  @override
  String get refundError => 'Error';

  @override
  String get refundCreateARefund => 'Create a refund';

  @override
  String get refundAttention => 'Attention!';

  @override
  String get refundSystemPaymentDisclaimer =>
      'One or more of your payments is a system payment. Be aware, that captures and refunds are not handled by Medusa for such payments.';

  @override
  String get refundDetails => 'Details';

  @override
  String get refundCannotRefundMoreThanTheOrdersNetTotal =>
      'Cannot refund more than the order\'s net total.';

  @override
  String get refundPromotion => 'Promotion';

  @override
  String get refundReason => 'Reason';

  @override
  String get refundNote => 'Note';

  @override
  String get refundPromotionForLoyalCustomer => 'Promotion for loyal customer';

  @override
  String get refundSendNotifications => 'Send notifications';

  @override
  String get refundCancel => 'Cancel';

  @override
  String get refundComplete => 'Complete';

  @override
  String get reservationReservationWasDeleted => 'Reservation was deleted';

  @override
  String get reservationTheAllocatedItemsHaveBeenReleased =>
      'The allocated items have been released.';

  @override
  String get reservationError => 'Error';

  @override
  String get reservationFailedToDeleteTheReservation =>
      'Failed to delete the reservation ';

  @override
  String get reservationReservationWasUpdated => 'Reservation was updated';

  @override
  String get reservationTheReservationChangeWasSaved =>
      'The reservation change was saved.';

  @override
  String get reservationErrors => 'Errors';

  @override
  String get reservationFailedToUpdateReservation =>
      'Failed to update reservation';

  @override
  String get reservationEditReservation => 'Edit Reservation';

  @override
  String get reservationLocation => 'Location';

  @override
  String get reservationChooseWhichLocationYouWantToShipTheItemsFrom =>
      'Choose which location you want to ship the items from.';

  @override
  String get reservationItemsToAllocateTitle => 'Items to Allocate';

  @override
  String get reservationSelectTheNumberOfItemsThatYouWishToAllocate =>
      'Select the number of items that you wish to allocate.';

  @override
  String reservationMaxReservationRequested(String maxReservation) {
    return ' / $maxReservation requested';
  }

  @override
  String get reservationReserved => ' reserved';

  @override
  String get reservationDescription => 'Description';

  @override
  String get reservationWhatTypeOfReservationIsThis =>
      'What type of reservation is this?';

  @override
  String get reservationMetadata => 'Metadata';

  @override
  String get reservationRemoveMetadata => 'Remove metadata';

  @override
  String get reservationAddMetadata => 'Add metadata';

  @override
  String get reservationDeleteReservation => 'Delete reservation';

  @override
  String get reservationCancel => 'Cancel';

  @override
  String get reservationSaveAndClose => 'Save and close';

  @override
  String get reservationCouldntAllocateItems => 'Couldn\'t allocate items';

  @override
  String get reservationItemsAllocated => 'Items allocated';

  @override
  String get reservationItemsHaveBeenAllocatedSuccessfully =>
      'Items have been allocated successfully';

  @override
  String get reservationSaveReservation => 'Save reservation';

  @override
  String get reservationLoading => 'Loading...';

  @override
  String get reservationAllocateOrderItems => 'Allocate order items';

  @override
  String get reservationChooseWhereYouWishToAllocateFrom =>
      'Choose where you wish to allocate from';

  @override
  String get reservationItemsToAllocate => 'Items to allocate';

  @override
  String get returnsSuccess => 'Success';

  @override
  String get returnsSuccessfullyReturnedOrder => 'Successfully returned order';

  @override
  String get returnsError => 'Error';

  @override
  String get returnsRequestReturn => 'Request Return';

  @override
  String get returnsItemsToReturn => 'Items to return';

  @override
  String get returnsChooseWhichLocationYouWantToReturnTheItemsTo =>
      'Choose which location you want to return the items to.';

  @override
  String get returnsSelectLocationToReturnTo => 'Select Location to Return to';

  @override
  String get returnsSelectedLocationHasNoInventoryLevels =>
      'The selected location does not have inventory levels for the selected items. The return can be requested but can\'t be received until an inventory level is created for the selected location.';

  @override
  String get returnsShipping => 'Shipping';

  @override
  String get returnsChooseReturShippingMethod =>
      'Choose which shipping method you want to use for this return.';

  @override
  String get returnsTotalRefund => 'Total Refund';

  @override
  String get returnsAmount => 'Amount';

  @override
  String get returnsSendNotifications => 'Send notifications';

  @override
  String get returnsNotifyCustomerOfCreatedReturn =>
      'Notify customer of created return';

  @override
  String get returnsBack => 'Back';

  @override
  String get returnsSubmit => 'Submit';

  @override
  String get rmaSubModalsSearchForAdditional => 'Search for additional';

  @override
  String get rmaSubModalsGeneral => 'General';

  @override
  String get rmaSubModalsFirstName => 'First Name';

  @override
  String get rmaSubModalsLastName => 'Last Name';

  @override
  String get rmaSubModalsPhone => 'Phone';

  @override
  String get rmaSubModalsShippingAddress => 'Shipping Address';

  @override
  String get rmaSubModalsAddress1 => 'Address 1';

  @override
  String get rmaSubModalsAddress2 => 'Address 2';

  @override
  String get rmaSubModalsProvince => 'Province';

  @override
  String get rmaSubModalsPostalCode => 'Postal code';

  @override
  String get rmaSubModalsCity => 'City';

  @override
  String get rmaSubModalsCountry => 'Country';

  @override
  String get rmaSubModalsBack => 'Back';

  @override
  String get rmaSubModalsAdd => 'Add';

  @override
  String get rmaSubModalsName => 'Name';

  @override
  String get rmaSubModalsStatus => 'Status';

  @override
  String get rmaSubModalsInStock => 'In Stock';

  @override
  String get rmaSubModalsProducts => 'Products';

  @override
  String get rmaSubModalsSearchProducts => 'Search Products..';

  @override
  String get rmaSubModalsReasonForReturn => 'Reason for Return';

  @override
  String get rmaSubModalsReason => 'Reason';

  @override
  String get rmaSubModalsNote => 'Note';

  @override
  String get swapSuccess => 'Success';

  @override
  String get swapSuccessfullyCreatedExchange => 'Successfully created exchange';

  @override
  String get swapError => 'Error';

  @override
  String get swapRegisterExchange => 'Register Exchange';

  @override
  String get swapItemsToReturn => 'Items to return';

  @override
  String get swapShipping => 'Shipping';

  @override
  String get swapShippingMethod => 'Shipping Method';

  @override
  String get swapAddAShippingMethod => 'Add a shipping method';

  @override
  String get swapLocation => 'Location';

  @override
  String get swapChooseWhichLocationYouWantToReturnTheItemsTo =>
      'Choose which location you want to return the items to.';

  @override
  String get swapSelectLocationToReturnTo => 'Select Location to Return to';

  @override
  String get swapItemsToSend => 'Items to send';

  @override
  String get swapAddProduct => 'Add Product';

  @override
  String get swapReturnTotal => 'Return Total';

  @override
  String get swapAdditionalTotal => 'Additional Total';

  @override
  String get swapOutbondShipping => 'Outbond Shipping';

  @override
  String get swapCalculatedAtCheckout => 'Calculated at checkout';

  @override
  String get swapEstimatedDifference => 'Estimated difference';

  @override
  String get swapSendNotifications => 'Send notifications';

  @override
  String get swapIfUncheckedTheCustomerWillNotReceiveCommunicationAboutThisExchange =>
      'If unchecked the customer will not receive communication about this exchange';

  @override
  String get swapComplete => 'Complete';

  @override
  String get templatesShipped => 'Shipped';

  @override
  String get templatesFulfilled => 'Fulfilled';

  @override
  String get templatesCanceled => 'Canceled';

  @override
  String get templatesPartiallyFulfilled => 'Partially fulfilled';

  @override
  String get templatesFulfillmentStatusRequiresAction => 'Requires Action';

  @override
  String get templatesAwaitingFulfillment => 'Awaiting fulfillment';

  @override
  String get templatesPartiallyShipped => 'Partially Shipped';

  @override
  String get templatesCancelFulfillmentHeading => 'Cancel fulfillment?';

  @override
  String get templatesAreYouSureYouWantToCancelTheFulfillment =>
      'Are you sure you want to cancel the fulfillment?';

  @override
  String get templatesSuccessfullyCanceledSwap => 'Successfully canceled swap';

  @override
  String get templatesError => 'Error';

  @override
  String get templatesSuccessfullyCanceledClaim =>
      'Successfully canceled claim';

  @override
  String get templatesSuccessfullyCanceledFulfillment =>
      'Successfully canceled fulfillment';

  @override
  String get templatesFulfillmentHasBeenCanceled =>
      'Fulfillment has been canceled';

  @override
  String templatesFulfilledByProvider(String title, String provider) {
    return '$title Fulfilled by $provider';
  }

  @override
  String get templatesNotShipped => 'Not shipped';

  @override
  String get templatesTracking => 'Tracking';

  @override
  String get templatesShippedFrom => 'Shipped from';

  @override
  String get templatesShippingFrom => 'Shipping from';

  @override
  String get templatesMarkShipped => 'Mark Shipped';

  @override
  String get templatesCancelFulfillment => 'Cancel Fulfillment';

  @override
  String get templatesCompleted => 'Completed';

  @override
  String get templatesProcessing => 'Processing';

  @override
  String get templatesRequiresAction => 'Requires action';

  @override
  String get templatesCapturePayment => 'Capture payment';

  @override
  String get templatesSuccessfullyCapturedPayment =>
      'Successfully captured payment';

  @override
  String get templatesRefund => 'Refund';

  @override
  String get templatesTotalForSwaps => 'Total for Swaps';

  @override
  String get templatesRefundedForSwaps => 'Refunded for Swaps';

  @override
  String get templatesRefundedForReturns => 'Refunded for Returns';

  @override
  String get templatesManuallyRefunded => 'Manually refunded';

  @override
  String get templatesNetTotal => 'Net Total';

  @override
  String get templatesPaid => 'Paid';

  @override
  String get templatesAwaitingPayment => 'Awaiting payment';

  @override
  String get templatesPaymentStatusRequiresAction => 'Requires Action';

  @override
  String get draftOrdersCompleted => 'Completed';

  @override
  String get draftOrdersOpen => 'Open';

  @override
  String get draftOrdersMarkAsPaid => 'Mark as paid';

  @override
  String get draftOrdersSuccess => 'Success';

  @override
  String get draftOrdersSuccessfullyMarkAsPaid => 'Successfully mark as paid';

  @override
  String get draftOrdersError => 'Error';

  @override
  String get draftOrdersSuccessfullyCanceledOrder =>
      'Successfully canceled order';

  @override
  String get draftOrdersBackToDraftOrders => 'Back to Draft Orders';

  @override
  String onMarkAsPaidConfirmOrderId(String displayId, Object display_id) {
    return 'Order #$displayId';
  }

  @override
  String get draftOrdersGoToOrder => 'Go to Order';

  @override
  String get draftOrdersCancelDraftOrder => 'Cancel Draft Order';

  @override
  String get draftOrdersDraftOrder => 'Draft Order';

  @override
  String get draftOrdersEmail => 'Email';

  @override
  String get draftOrdersPhone => 'Phone';

  @override
  String draftOrdersAmount(String currencyCode, Object currency_code) {
    return 'Amount $currencyCode';
  }

  @override
  String get draftOrdersPayment => 'Payment';

  @override
  String get draftOrdersSubtotal => 'Subtotal';

  @override
  String get draftOrdersShipping => 'Shipping';

  @override
  String get draftOrdersTax => 'Tax';

  @override
  String get draftOrdersTotalToPay => 'Total to pay';

  @override
  String get draftOrdersPaymentLink => 'Payment link:';

  @override
  String get draftOrdersConfigurePaymentLinkInStoreSettings =>
      'Configure payment link in store settings';

  @override
  String get draftOrdersShippingMethod => 'Shipping Method';

  @override
  String get draftOrdersData => 'Data';

  @override
  String get draftOrders1Item => '(1 item)';

  @override
  String get draftOrdersCustomer => 'Customer';

  @override
  String get draftOrdersEditShippingAddress => 'Edit Shipping Address';

  @override
  String get draftOrdersEditBillingAddress => 'Edit Billing Address';

  @override
  String get draftOrdersGoToCustomer => 'Go to Customer';

  @override
  String get draftOrdersContact => 'Contact';

  @override
  String get draftOrdersBilling => 'Billing';

  @override
  String get draftOrdersRawDraftOrder => 'Raw Draft Order';

  @override
  String get draftOrdersAreYouSure => 'Are you sure?';

  @override
  String draftOrdersRemoveResourceHeading(String resource) {
    return 'Remove $resource';
  }

  @override
  String draftOrdersRemoveResourceSuccessText(String resource) {
    return '$resource has been removed';
  }

  @override
  String get draftOrdersThisWillCreateAnOrderMarkThisAsPaidIfYouReceivedThePayment =>
      'This will create an order. Mark this as paid if you received the payment.';

  @override
  String get draftOrdersMarkPaid => 'Mark paid';

  @override
  String get draftOrdersCancel => 'Cancel';

  @override
  String get draftOrdersCreateDraftOrder => 'Create draft order';

  @override
  String get editAmountPaid => 'Amount Paid';

  @override
  String get editNewTotal => 'New Total';

  @override
  String get editDifferenceDue => 'Difference Due';

  @override
  String get editBack => 'Back';

  @override
  String get editSaveAndGoBack => 'Save and go back';

  @override
  String get editOrderEditSetAsRequested => 'Order edit set as requested';

  @override
  String get editFailedToRequestConfirmation =>
      'Failed to request confirmation';

  @override
  String get editAddedSuccessfully => 'Added successfully';

  @override
  String get editErrorOccurred => 'Error occurred';

  @override
  String get editAddProductVariants => 'Add Product Variants';

  @override
  String get editEditOrder => 'Edit Order';

  @override
  String get editItems => 'Items';

  @override
  String get editAddItems => 'Add items';

  @override
  String get editFilterItems => 'Filter items...';

  @override
  String get editNote => 'Note';

  @override
  String get editAddANote => 'Add a note...';

  @override
  String variantsTableLocation(String location) {
    return ' in $location';
  }

  @override
  String get editProduct => 'Product';

  @override
  String get editInStock => 'In Stock';

  @override
  String get editPrice => 'Price';

  @override
  String get editProducts => 'Products';

  @override
  String get editSearchProductVariants => 'Search Product Variants...';

  @override
  String get ordersSuccess => 'Success';

  @override
  String get ordersSuccessfullyInitiatedExport =>
      'Successfully initiated export';

  @override
  String get ordersError => 'Error';

  @override
  String get ordersExportOrders => 'Export Orders';

  @override
  String get componentsBillingAddress => 'Billing Address';

  @override
  String get componentsUseSameAsShipping => 'Use same as shipping';

  @override
  String get componentsEGGiftWrapping => 'E.g. Gift wrapping';

  @override
  String get componentsTitle => 'Title';

  @override
  String get componentsPrice => 'Price';

  @override
  String get componentsQuantity => 'Quantity';

  @override
  String get componentsBack => 'Back';

  @override
  String get componentsAdd => 'Add';

  @override
  String get componentsItemsForTheOrder => 'Items for the order';

  @override
  String get componentsDetails => 'Details';

  @override
  String get componentsPriceExclTaxes => 'Price (excl. Taxes)';

  @override
  String get componentsAddCustom => 'Add Custom';

  @override
  String get componentsAddExisting => 'Add Existing';

  @override
  String get componentsAddProducts => 'Add Products';

  @override
  String get componentsAddCustomItem => 'Add Custom Item';

  @override
  String get componentsChooseRegion => 'Choose region';

  @override
  String get componentsRegion => 'Region';

  @override
  String selectShippingToName(String name) {
    return '(To $name)';
  }

  @override
  String get componentsAttention => 'Attention!';

  @override
  String get componentsNoOptionsForOrdersWithoutShipping =>
      'You don\'t have any options for orders without shipping. Please add one (e.g. In-store fulfillment) with Show on website unchecked in region settings and continue.';

  @override
  String get componentsChooseAShippingMethod => 'Choose a shipping method';

  @override
  String get componentsSetCustomPrice => 'Set custom price';

  @override
  String get componentsCustomPrice => 'Custom Price';

  @override
  String get componentsCustomerAndShippingDetails =>
      'Customer and shipping details';

  @override
  String get componentsFindExistingCustomer => 'Find existing customer';

  @override
  String get componentsEmail => 'Email';

  @override
  String get componentsChooseExistingAddresses => 'Choose existing addresses';

  @override
  String get componentsCreateNew => 'Create new';

  @override
  String get componentsThePromotionIsNotApplicableToTheSelectedRegion =>
      'The promotion is not applicable to the selected region';

  @override
  String get componentsThePromotionCodeIsInvalid =>
      'The promotion code is invalid';

  @override
  String get componentsAddPromotion => 'Add Promotion';

  @override
  String get componentsSummer10 => 'SUMMER10';

  @override
  String get componentsPromotion => 'Promotion';

  @override
  String selectShippingCode(String code) {
    return '(Code: $code)';
  }

  @override
  String get componentsType => 'Type';

  @override
  String get componentsValue => 'Value';

  @override
  String get componentsAddress => 'Address';

  @override
  String get componentsShippingMethod => 'Shipping method';

  @override
  String get componentsBillingDetails => 'Billing details';

  @override
  String get componentsEdit => 'Edit';

  @override
  String get formUseNewOrderFormMustBeUsedWithinNewOrderFormProvider =>
      'useNewOrderForm must be used within NewOrderFormProvider';

  @override
  String get newOrderCreated => 'Order created';

  @override
  String get newCreateDraftOrder => 'Create Draft Order';

  @override
  String get priceListProductFilterCreatedAt => 'Created at';

  @override
  String get priceListProductFilterUpdatedAt => 'Updated at';

  @override
  String get priceListDetailsDrawerPromptTitle => 'Are you sure?';

  @override
  String get priceListDetailsDrawerPromptDescription =>
      'You have unsaved changes, are you sure you want to exit?';

  @override
  String get priceListDetailsNotificationSuccesTitle => 'Price list updated';

  @override
  String get priceListDetailsDrawerNotificationSuccessMessage =>
      'Successfully updated price list';

  @override
  String get priceListDetailsDrawerNotificationErrorTitle =>
      'An error occurred';

  @override
  String get priceListDetailsDrawerTitle => 'Edit Price List Details';

  @override
  String get priceListDetailsDrawerCancelButton => 'Cancel';

  @override
  String get priceListDetailsDrawerSaveButton => 'Save';

  @override
  String get priceListDetailsSectionPromptConfirmText => 'Delete';

  @override
  String get priceListDetailsSectionPromptCancelText => 'Cancel';

  @override
  String get priceListDetailsSectionPromptTitle => 'Delete price list';

  @override
  String priceListDetailsSectionPromptDescription(String name) {
    return 'Are you sure you want to delete the price list $name?';
  }

  @override
  String get priceListDetailsSectionDeleteNotificationSuccessTitle =>
      'Successfully deleted price list';

  @override
  String priceListDetailsSectionDeleteNotificationSuccessMessage(String name) {
    return 'The price list $name was successfully deleted';
  }

  @override
  String get priceListDetailsSectionDeleteNotificationErrorTitle =>
      'Failed to delete price list';

  @override
  String get priceListDetailsSectionCustomerGroups => 'Customer Groups';

  @override
  String get priceListDetailsSectionLastEdited => 'Last edited';

  @override
  String get priceListDetailsSectionNumberOfPrices => 'Prices';

  @override
  String get priceListDetailsSectionStatusMenuExpired => 'Expired';

  @override
  String get priceListDetailsSectionStatusMenuDraft => 'Draft';

  @override
  String get priceListDetailsSectionStatusMenuScheduled => 'Scheduled';

  @override
  String get priceListDetailsSectionStatusActive => 'Active';

  @override
  String get priceListDetailsSectionStatusMenuNotificationSuccessTitle =>
      'Successfully updated price list status';

  @override
  String priceListDetailsSectionStatusMenuNotificationSuccessMessage(
      String status) {
    return 'The price list status was successfully updated to $status';
  }

  @override
  String get priceListDetailsSectionStatusMenuNotificationErrorTitle =>
      'Failed to update price list status';

  @override
  String get priceListDetailsSectionStatusMenuItemDraft => 'Draft';

  @override
  String get priceListDetailsSectionStatusMenuItemActivate => 'Activate';

  @override
  String get priceListDetailsMenuItemEdit => 'Edit details';

  @override
  String get priceListDetailsMenuItemDelete => 'Delete';

  @override
  String get priceListEditError =>
      'An error occurred while loading price list. Reload the page and try again. If the issue persists, try again later.';

  @override
  String get priceListNewFormPromptTitle => 'Are you sure?';

  @override
  String get priceListNewFormPromptExitDescription =>
      'You have unsaved changes, are you sure you want to exit?';

  @override
  String get priceListNewFormPromptBackDescription =>
      'You have unsaved changes, are you sure you want to go back?';

  @override
  String get priceListAddProductsModalNoPricesError =>
      'Please assign prices for at least one product.';

  @override
  String get priceListAddProductsModalMissingPricesTitle =>
      'Incomplete price list';

  @override
  String get priceListAddProductsModalMissingPricesDescription =>
      'Prices have not been assigned to all of your chosen products. Would you like to continue?';

  @override
  String get priceListAddProductsModalSuccessTitle => 'New prices added';

  @override
  String get priceListAddProductsModalSuccessMessage =>
      'The new prices have been added to the price list.';

  @override
  String get priceListAddProductsModalErrorTitle => 'An error occurred';

  @override
  String get priceListAddProductsModalBackButtonCancel => 'Cancel';

  @override
  String get priceListAddProductsModalBackButton => 'Back';

  @override
  String get priceListAddProductsModalNextButtonContinue => 'Continue';

  @override
  String get priceListAddProductsModalNextButtonSubmitAndClose =>
      'Submit and Close';

  @override
  String get priceListAddProductsModalNextButtonContinueSavePrices =>
      'Save Prices';

  @override
  String get priceListAddProductsModalProductsTab => 'Choose Products';

  @override
  String get priceListAddProductsModalPricesTab => 'Edit Prices';

  @override
  String get priceListAddProductsModalError =>
      'An error occurred while preparing the form. Reload the page and try again. If the issue persists, try again later.';

  @override
  String get priceListEditPricesModalPromptTitle => 'Unsaved changes';

  @override
  String get priceListEditPricesModalPromptExitDescription =>
      'You have unsaved changes, are you sure you want to exit?';

  @override
  String get priceListEditPricesModalPromptBackDescription =>
      'You have unsaved changes, are you sure you want to go back?';

  @override
  String get priceListEditPricesModalNotificationUpdateError =>
      'An error occurred';

  @override
  String get priceListEditPricesModalNotificationRemoveErrorTitle =>
      'An error occurred';

  @override
  String get priceListEditPricesModalNotificationRemoveErrorDescription =>
      'Some prices were not updated correctly. Try again.';

  @override
  String get priceListEditPricesModalNotificationUpdateSuccessTitle =>
      'Prices updated';

  @override
  String get priceListEditPricesModalNotificationUpdateSuccessDescription =>
      'Successfully updated prices';

  @override
  String get priceListEditPricesModalNextButtonSaveAndClose => 'Save and Close';

  @override
  String get priceListEditPricesModalNextButtonSave => 'Save Prices';

  @override
  String get priceListEditPricesModalBackButtonCancel => 'Cancel';

  @override
  String get priceListEditPricesModalBackButtonBack => 'Back';

  @override
  String get priceListEditPricesModalOverviewTab => 'Edit Prices';

  @override
  String get priceListEditPricesModalErrorLoading =>
      'An error occurred while preparing the form. Reload the page and try again. If the issue persists, try again later.';

  @override
  String get priceListPricesSectionPromptTitle => 'Are you sure?';

  @override
  String get priceListPricesSectionPromptDescription =>
      'This will permanently delete the product prices from the list';

  @override
  String get priceListPricesSectonDeleteSuccessTitle => 'Prices deleted';

  @override
  String priceListPricesSectionDeleteSuccessDescriptionOne(String count) {
    return 'Successfully deleted prices for $count products';
  }

  @override
  String priceListPricesSectionDeleteSuccessDescriptionOther(String count) {
    return 'Successfully deleted prices for $count products';
  }

  @override
  String get priceListPricesSectionDeleteErrorTitle => 'An error occurred';

  @override
  String get priceListPricesSectionHeading => 'Prices';

  @override
  String get priceListPricesSectionSearchPlaceholder => 'Search products';

  @override
  String get priceListPricesSectionPricesMenuEdit => 'Edit prices';

  @override
  String get priceListPricesSectionPricesMenuAdd => 'Add products';

  @override
  String get priceListPricesSectionTableLoadError =>
      'An error occurred while fetching the products. Try to reload the page, or if the issue persists, try again later.';

  @override
  String priceListPricesSectionBarCountOne(String count) {
    return '$count selected';
  }

  @override
  String priceListPricesSectionBarCountOther(String count) {
    return '$count selected';
  }

  @override
  String get priceListPricesSectionEditCommand => 'Edit';

  @override
  String get priceListPricesSectionDeleteCommand => 'Delete';

  @override
  String get priceListPricesSectionSelectAllCheckboxLabel =>
      'Select all products on the current page';

  @override
  String get priceListPricesSectionSelectCheckboxLabel => 'Select row';

  @override
  String get priceListPricesSectionTableProduct => 'Product';

  @override
  String priceListPricesSectionTableThumbnailAlt(String title) {
    return '$title thumbnail';
  }

  @override
  String get priceListPricesSectionTableCollection => 'Collection';

  @override
  String get priceListPricesSectionTableVariants => 'Variants';

  @override
  String get priceListDetailsFormTypeHeading => 'Type';

  @override
  String get priceListDetailsFormTypeDescription =>
      'Choose the type of price list you want to create.';

  @override
  String get priceListDetailsFormTypeLabelSale => 'Sale';

  @override
  String get priceListDetailsFormTypeHintSale =>
      'Use this if you are creating a sale.';

  @override
  String get priceListDetailsFormTypeLabelOverride => 'Override';

  @override
  String get priceListDetailsFormTypeHintOverride =>
      'Use this if you are overriding prices.';

  @override
  String get priceListDetailsFormGeneralHeading => 'General';

  @override
  String get priceListDetailsFormGeneralDescription =>
      'Choose a title and description for the price list.';

  @override
  String get priceListDetailsFormGeneralNameLabel => 'Name';

  @override
  String get priceListDetailsFormGeneralNamePlaceholder => 'Black Friday Sale';

  @override
  String get priceListDetailsFormGeneralDescriptionLabel => 'Description';

  @override
  String get priceListDetailsFormGeneralDescriptionPlaceholder =>
      'Prices for the Black Friday sale...';

  @override
  String get priceListDetailsFormTaxInclusiveLabel => 'Tax inclusive prices';

  @override
  String get priceListDetailsFormTaxInclusiveHint =>
      'Choose to make all prices in this list inclusive of tax.';

  @override
  String get priceListDetailsFormDatesStartsAtHeading =>
      'Price list has a start date?';

  @override
  String get priceListDetailsFormDatesStartsAtDescription =>
      'Schedule the price overrides to activate in the future.';

  @override
  String get priceListDetailsFormDatesStartsAtLabel => 'Start date';

  @override
  String get priceListDetailsFormEndsAtHeading =>
      'Price list has an expiry date?';

  @override
  String get priceListDetailsFormEndsAtDescription =>
      'Schedule the price overrides to deactivate in the future.';

  @override
  String get priceListDetailsFormEndsAtLabel => 'Expiry date';

  @override
  String get priceListDetailsFormCustomerGroupsName => 'Name';

  @override
  String get priceListDetailsFormCustomerGroupsMembers => 'Members';

  @override
  String get priceListDetailsFormCustomerGroupsError =>
      'An error occurred while loading customer groups. Reload the page and try again. If the issue persists, try again later.';

  @override
  String get priceListDetailsFormCustomerGroupsNoGroups =>
      'No customer groups found.';

  @override
  String get priceListDetailsFormCustomerGroupsHeading =>
      'Customer availability';

  @override
  String get priceListDetailsFormCustomerGroupsDescription =>
      'Specify which customer groups the price overrides should apply for.';

  @override
  String get priceListDetailsFormCustomerGroupsContentHeading =>
      'Customer Groups';

  @override
  String get priceListDetailsFormCustomerGroupsSearchPlaceholder => 'Search';

  @override
  String get priceListPricesFormProductsError =>
      'An error occurred while preparing the form. Reload the page and try again. If the issue persists, try again later.';

  @override
  String get priceListPricesFormHeading => 'Edit prices';

  @override
  String get priceListPricesFormVariant => 'Variant';

  @override
  String get priceListPricesFormSku => 'SKU';

  @override
  String get priceListPricesFormPrices => 'Prices';

  @override
  String priceListPricesFormPricesVariantCountOne(String count) {
    return '$count variants';
  }

  @override
  String priceListPricesFormPricesVariantCountOther(String count) {
    return '$count variants';
  }

  @override
  String get priceListPricesFormAddPricesButton => 'Add prices';

  @override
  String priceListPricesFormPricesCountOne(String count) {
    return '$count prices';
  }

  @override
  String priceListPricesFormPricesCountOther(String count) {
    return '$count prices';
  }

  @override
  String get priceListProductPricesFormInvalidDataTitle => 'Invalid data';

  @override
  String get priceListProductPricesFormInvalidDataBody =>
      'The data you pasted contains values that are not numbers.';

  @override
  String get priceListProductPricesFormColumnVisibilityButton => 'View';

  @override
  String get priceListProductPricesFormColumnVisibilityCurrenciesLabel =>
      'Currencies';

  @override
  String get priceListProductPricesFormColumnVisibilityRegionsLabel =>
      'Regions';

  @override
  String get priceListProductPricesFormColumnProductLabel => 'Product';

  @override
  String priceListProductPricesFormColumnCurrenciesPriceLabel(String code) {
    return 'Price $code';
  }

  @override
  String priceListProductPricesFormColumnRegionsPriceLabel(
      String code, String name) {
    return 'Price $name ($code)';
  }

  @override
  String get priceListProductsFormSelectAll =>
      'Select all products on the current page';

  @override
  String get priceListProductsFormSelectRow => 'Select row';

  @override
  String get priceListProductsFormProductLabel => 'Product';

  @override
  String priceListProductsFormProductThumbnail(String title) {
    return '$title thumbnail';
  }

  @override
  String get priceListProductsFormCollectionLabel => 'Collection';

  @override
  String get priceListProductsFormSalesChannelsLabel => 'Availability';

  @override
  String priceListProductsFormSalesChannelsValue(
      String first, String remaining) {
    return '$first + $remaining more';
  }

  @override
  String get priceListProductsFormStatusLabel => 'Status';

  @override
  String get priceListProductsFormInventoryLabel => 'Inventory';

  @override
  String priceListProductsFormInventoryValue(
      String totalStock, String variants) {
    return 'totalStock in stock across $variants variants';
  }

  @override
  String get priceListProductsFormLoading => 'Loading products';

  @override
  String get priceListProductsFormError =>
      'An error occurred while loading products. Reload the page and try again. If the issue persists, try again later.';

  @override
  String get priceListProductsFormNoProducts => 'No products found.';

  @override
  String get priceListProductsFormHeading => 'Choose products';

  @override
  String get priceListProductsFormSearchPlaceholder => 'Search';

  @override
  String get priceListNewFormNoPricesError =>
      'Please set prices for at least one product.';

  @override
  String get priceListNewFormMissingPricesTitle => 'Incomplete price list';

  @override
  String get priceListNewProductsModalMissingPricesDescription =>
      'Prices have not been assigned to all of your chosen products. Would you like to proceed?';

  @override
  String get priceListNewFormNotificationSuccessTitle => 'Price list created';

  @override
  String get priceListNewFormNotificationSuccessMessage =>
      'Successfully created price list';

  @override
  String get priceListNewFormNotificationErrorTitle => 'An error occurred';

  @override
  String get priceListNewFormNextButtonSaveAndPublish => 'Save and Publish';

  @override
  String get priceListNewFormNextButtonSave => 'Save Prices';

  @override
  String get priceListNewFormNextButtonContinue => 'Continue';

  @override
  String get priceListNewFormBackButtonCancel => 'Cancel';

  @override
  String get priceListNewFormBackButtonBack => 'Back';

  @override
  String get priceListNewFormDetailsTab => 'Create Price List';

  @override
  String get priceListNewFormProductsTab => 'Choose Products';

  @override
  String get priceListNewFormPricesTab => 'Edit Prices';

  @override
  String get priceListNewFormSaveAsDraft => 'Save as Draft';

  @override
  String get priceListNewFormErrorLoadingProducts =>
      'An error occurred while preparing the form. Reload the page and try again. If the issue persists, try again later.';

  @override
  String get componentsSuccess => 'Success';

  @override
  String get componentsSuccessfullyUpdatedCategoryTree =>
      'Successfully updated category tree';

  @override
  String get componentsError => 'Error';

  @override
  String get componentsFailedToUpdateCategoryTree =>
      'Failed to update category tree';

  @override
  String get componentsDelete => 'Delete';

  @override
  String get componentsCategoryDeleted => 'Category deleted';

  @override
  String get componentsCategoryDeletionFailed => 'Category deletion failed';

  @override
  String get componentsCategoryStatusIsInactive =>
      'Category status is inactive';

  @override
  String get componentsCategoryVisibilityIsPrivate =>
      'Category visibility is private';

  @override
  String get componentsAddCategoryItemTo => 'Add category item to';

  @override
  String get modalsPublic => 'Public';

  @override
  String get modalsPrivate => 'Private';

  @override
  String get modalsActive => 'Active';

  @override
  String get modalsInactive => 'Inactive';

  @override
  String get modalsSuccess => 'Success';

  @override
  String get modalsSuccessfullyCreatedACategory =>
      'Successfully created a category';

  @override
  String get modalsFailedToCreateANewCategory =>
      'Failed to create a new category';

  @override
  String get modalsError => 'Error';

  @override
  String get modalsSaveCategory => 'Save category';

  @override
  String modalsAddCategoryTo(String name) {
    return 'Add category to $name';
  }

  @override
  String get modalsAddCategory => 'Add category';

  @override
  String get modalsDetails => 'Details';

  @override
  String get modalsName => 'Name';

  @override
  String get modalsGiveThisCategoryAName => 'Give this category a name';

  @override
  String get modalsHandle => 'Handle';

  @override
  String get modalsCustomHandle => 'Custom handle';

  @override
  String get modalsDescription => 'Description';

  @override
  String get modalsGiveThisCategoryADescription =>
      'Give this category a description';

  @override
  String get modalsStatus => 'Status';

  @override
  String get modalsVisibility => 'Visibility';

  @override
  String get modalsSuccessfullyUpdatedTheCategory =>
      'Successfully updated the category';

  @override
  String get modalsFailedToUpdateTheCategory => 'Failed to update the category';

  @override
  String get modalsEditProductCategory => 'Edit product category';

  @override
  String get modalsCancel => 'Cancel';

  @override
  String get modalsSaveAndClose => 'Save and close';

  @override
  String get pagesNoProductCategoriesYet =>
      'No product categories yet, use the above button to create your first category.';

  @override
  String get pagesAddCategory => 'Add category';

  @override
  String get pagesProductCategories => 'Product Categories';

  @override
  String get pagesHelpsYouToKeepYourProductsOrganized =>
      'Helps you to keep your products organized.';

  @override
  String get batchJobSuccess => 'Success';

  @override
  String get batchJobImportConfirmedForProcessingProgressInfoIsAvailableInTheActivityDrawer =>
      'Import confirmed for processing. Progress info is available in the activity drawer.';

  @override
  String get batchJobError => 'Error';

  @override
  String get batchJobImportFailed => 'Import failed.';

  @override
  String get batchJobFailedToDeleteTheCsvFile =>
      'Failed to delete the CSV file';

  @override
  String get batchJobFailedToCancelTheBatchJob =>
      'Failed to cancel the batch job';

  @override
  String get batchJobProductsList => 'products list';

  @override
  String get batchJobUnsureAboutHowToArrangeYourList =>
      'Unsure about how to arrange your list?';

  @override
  String get batchJobDownloadTemplate =>
      'Download the template below to ensure you are following the correct format.';

  @override
  String get batchJobImportsDescription =>
      'Through imports you can add or update products. To update existing products/variants you must set an existing id in the Product/Variant id columns. If the value is unset a new record will be created. You will be asked for confirmation before we import products.';

  @override
  String get productsFilters => 'Filters';

  @override
  String get productsStatus => 'Status';

  @override
  String get productsTags => 'Tags';

  @override
  String get productsSpringSummer => 'Spring, summer...';

  @override
  String get newSalesChannels => 'Sales channels';

  @override
  String get newThisProductWillOnlyBeAvailableInTheDefaultSalesChannelIfLeftUntouched =>
      'This product will only be available in the default sales channel if left untouched.';

  @override
  String get newChangeAvailablity => 'Change availablity';

  @override
  String get addVariantsAVariantWithTheseOptionsAlreadyExists =>
      'A variant with these options already exists.';

  @override
  String get addVariantsProductOptions => 'Product options';

  @override
  String get addVariantsOptionsAreUsedToDefineTheColorSizeEtcOfTheProduct =>
      'Options are used to define the color, size, etc. of the product.';

  @override
  String get addVariantsOptionTitle => 'Option title';

  @override
  String get addVariantsVariationsCommaSeparated =>
      'Variations (comma separated)';

  @override
  String get addVariantsColor => 'Color...';

  @override
  String get addVariantsAlreadyExists => 'already exists';

  @override
  String get addVariantsBlueRedBlack => 'Blue, Red, Black...';

  @override
  String get addVariantsAddAnOption => 'Add an option';

  @override
  String get addVariantsProductVariants => 'Product variants';

  @override
  String get addVariantsYouMustAddAtLeastOneProductOptionBeforeYouCanBeginAddingProductVariants =>
      'You must add at least one product option before you can begin adding product variants.';

  @override
  String get addVariantsVariant => 'Variant';

  @override
  String get addVariantsInventory => 'Inventory';

  @override
  String get addVariantsAddAVariant => 'Add a variant';

  @override
  String get addVariantsCreateVariant => 'Create Variant';

  @override
  String get addVariantsCancel => 'Cancel';

  @override
  String get addVariantsSaveAndClose => 'Save and close';

  @override
  String get newVariantAVariantWithTheseOptionsAlreadyExists =>
      'A variant with these options already exists.';

  @override
  String get newVariantAreYouSureYouWantToDeleteThisVariant =>
      'Are you sure you want to delete this variant?';

  @override
  String get newVariantDeleteVariant => 'Delete Variant';

  @override
  String get newVariantEdit => 'Edit';

  @override
  String get newVariantDelete => 'Delete';

  @override
  String get newVariantEditVariant => 'Edit Variant';

  @override
  String get newVariantCancel => 'Cancel';

  @override
  String get newVariantSaveAndClose => 'Save and close';

  @override
  String get newSomethingWentWrongWhileTryingToUploadImages =>
      'Something went wrong while trying to upload images.';

  @override
  String get newNoFileServiceConfigured =>
      'You might not have a file service configured. Please contact your administrator';

  @override
  String get newUploadThumbnailError =>
      'Something went wrong while trying to upload the thumbnail.';

  @override
  String get newSaveAsDraft => 'Save as draft';

  @override
  String get newPublishProduct => 'Publish product';

  @override
  String get newGeneralInformationTitle => 'General information';

  @override
  String get newToStartSellingAllYouNeedIsANameAndAPrice =>
      'To start selling, all you need is a name and a price.';

  @override
  String get newOrganizeProduct => 'Organize Product';

  @override
  String get newAddVariationsOfThisProduct => 'Add variations of this product.';

  @override
  String get newOfferYourCustomersDifferentOptionsForColorFormatSizeShapeEtc =>
      'Offer your customers different options for color, format, size, shape, etc.';

  @override
  String get newUsedForShippingAndCustomsPurposes =>
      'Used for shipping and customs purposes.';

  @override
  String get newDimensions => 'Dimensions';

  @override
  String get newCustoms => 'Customs';

  @override
  String get newUsedToRepresentYourProductDuringCheckoutSocialSharingAndMore =>
      'Used to represent your product during checkout, social sharing and more.';

  @override
  String get newMedia => 'Media';

  @override
  String get newAddImagesToYourProduct => 'Add images to your product.';

  @override
  String get overviewImportProducts => 'Import Products';

  @override
  String get overviewExportProducts => 'Export Products';

  @override
  String get overviewNewProduct => 'New Product';

  @override
  String get overviewNewCollection => 'New Collection';

  @override
  String get overviewSuccess => 'Success';

  @override
  String get overviewSuccessfullyCreatedCollection =>
      'Successfully created collection';

  @override
  String get overviewError => 'Error';

  @override
  String get overviewSuccessfullyInitiatedExport =>
      'Successfully initiated export';

  @override
  String get modalsAddSalesChannels => 'Add sales channels';

  @override
  String get modalsFindChannels => 'Find channels';

  @override
  String get modalsUpdatedTheApiKey => 'Updated the API key';

  @override
  String get modalsFailedToUpdateTheApiKey => 'Failed to update the API key';

  @override
  String get modalsEditApiKeyDetails => 'Edit API key details';

  @override
  String get modalsTitle => 'Title';

  @override
  String get modalsNameYourKey => 'Name your key';

  @override
  String get modalsSalesChannelsAddedToTheScope =>
      'Sales channels added to the scope';

  @override
  String get modalsErrorOccurredWhileAddingSalesChannelsToTheScopeOfTheKey =>
      'Error occurred while adding sales channels to the scope of the key';

  @override
  String get modalsAddAndGoBack => 'Add and go back';

  @override
  String get modalsAddAndClose => 'Add and close';

  @override
  String get modalsSalesChannelsRemovedFromTheScope =>
      'Sales channels removed from the scope';

  @override
  String get modalsErrorOccurredWhileRemovingSalesChannelsFromTheScopeOfTheKey =>
      'Error occurred while removing sales channels from the scope of the key';

  @override
  String get modalsEditSalesChannels => 'Edit sales channels';

  @override
  String publishableApiKeysModalsManageSalesChannelsSelectedWithCountsOne(
      String count) {
    return '$count';
  }

  @override
  String publishableApiKeysModalsManageSalesChannelsSelectedWithCountsOther(
      String count) {
    return '$count';
  }

  @override
  String get modalsDeselect => 'Deselect';

  @override
  String get modalsRemove => 'Remove';

  @override
  String get modalsAddChannels => 'Add channels';

  @override
  String get modalsClose => 'Close';

  @override
  String get pagesSalesChannels => 'Sales channels';

  @override
  String get pagesConnectAsManySalesChannelsToYourApiKeyAsYouNeed =>
      'Connect as many sales channels to your API key as you need.';

  @override
  String get pagesAddSalesChannels => 'Add sales channels';

  @override
  String get pagesEditSalesChannels => 'Edit sales channels';

  @override
  String get pagesSuccess => 'Success';

  @override
  String get pagesCreatedANewApiKey => 'Created a new API key';

  @override
  String get pagesError => 'Error';

  @override
  String get pagesFailedToCreateANewApiKey => 'Failed to create a new API key';

  @override
  String get pagesSalesChannelsAddedToTheScope =>
      'Sales channels added to the scope';

  @override
  String get pagesErrorOccurredWhileAddingSalesChannelsToTheScopeOfTheKey =>
      'Error occurred while adding sales channels to the scope of the key';

  @override
  String get pagesPublishApiKey => 'Publish API key';

  @override
  String get pagesCreateApiKey => 'Create API Key';

  @override
  String get pagesCreateAndManageApiKeysRightNowThisIsOnlyRelatedToSalesChannels =>
      'Create and manage API keys. Right now this is only related to sales channels.';

  @override
  String get pagesCreateApiKeyLabel => 'Create API key';

  @override
  String get pagesBackToSettings => 'Back to settings';

  @override
  String get pagesPublishableApiKeys => 'Publishable API keys';

  @override
  String get pagesThesePublishableKeysWillAllowYouToAuthenticateApiRequests =>
      'These publishable keys will allow you to authenticate API requests.';

  @override
  String get tablesName => 'Name';

  @override
  String get tablesToken => 'Token';

  @override
  String get tablesDone => 'done';

  @override
  String get tablesCopyToClipboard => 'Copy to clipboard';

  @override
  String get tablesCreated => 'Created';

  @override
  String get tablesStatus => 'Status';

  @override
  String get tablesRevoked => 'Revoked';

  @override
  String get tablesLive => 'Live';

  @override
  String get tablesEditApiKeyDetails => 'Edit API key details';

  @override
  String get tablesEditSalesChannels => 'Edit sales channels';

  @override
  String get tablesCopyToken => 'Copy token';

  @override
  String get tablesRevokeToken => 'Revoke token';

  @override
  String get tablesDeleteApiKey => 'Delete API key';

  @override
  String get tablesYesDelete => 'Yes, delete';

  @override
  String get tablesApiKeyDeleted => 'API key deleted';

  @override
  String get tablesAreYouSureYouWantToDeleteThisPublicKey =>
      'Are you sure you want to delete this public key?';

  @override
  String get tablesDeleteKey => 'Delete key';

  @override
  String get tablesYesRevoke => 'Yes, revoke';

  @override
  String get tablesApiKeyRevoked => 'API key revoked';

  @override
  String get tablesAreYouSureYouWantToRevokeThisPublicKey =>
      'Are you sure you want to revoke this public key?';

  @override
  String get tablesRevokeKey => 'Revoke key';

  @override
  String get tablesApiKeys => 'API Keys';

  @override
  String get tablesNoKeysYetUseTheAboveButtonToCreateYourFirstPublishableKey =>
      'No keys yet, use the above button to create your first publishable key';

  @override
  String get tablesTitle => 'Title';

  @override
  String get tablesDescription => 'Description';

  @override
  String get tablesNoAddedSalesChannels => 'No added sales channels';

  @override
  String get tablesSalesChannels => 'Sales Channels';

  @override
  String get formTitle => 'Title';

  @override
  String get formWebsiteAppAmazonPhysicalStorePosFacebookProductFeed =>
      'Website, app, Amazon, physical store POS, facebook product feed...';

  @override
  String get formDescription => 'Description';

  @override
  String get formAvailableProductsAtOurWebsiteApp =>
      'Available products at our website, app...';

  @override
  String get formSuccess => 'Success';

  @override
  String get formTheSalesChannelIsSuccessfullyUpdated =>
      'The sales channel is successfully updated';

  @override
  String get formError => 'Error';

  @override
  String get formFailedToUpdateTheSalesChannel =>
      'Failed to update the sales channel';

  @override
  String get formSalesChannelDetails => 'Sales channel details';

  @override
  String get formGeneralInfo => 'General info';

  @override
  String get formName => 'Name';

  @override
  String get formClose => 'Close';

  @override
  String get formSave => 'Save';

  @override
  String get pagesDraft => 'Draft';

  @override
  String get pagesControlWhichProductsAreAvailableInWhichChannels =>
      'Control which products are available in which channels';

  @override
  String get pagesSearchByTitleOrDescription =>
      'Search by title or description';

  @override
  String get pagesConfirmDeleteSalesChannel =>
      'Are you sure you want to delete this sales channel? The setup you made will be gone forever.';

  @override
  String get pagesDeleteChannelHeading => 'Delete Channel';

  @override
  String get pagesEditGeneralInfo => 'Edit general info';

  @override
  String get pagesAddProducts => 'Add products';

  @override
  String get pagesDeleteChannel => 'Delete channel';

  @override
  String get pagesDisabled => 'Disabled';

  @override
  String get pagesEnabled => 'Enabled';

  @override
  String get tablesCollection => 'Collection';

  @override
  String get tablesStartBuildingYourChannelsSetup =>
      'Start building your channels setup...';

  @override
  String get tablesNoProductsInChannels =>
      'You haven’t added any products to this channels yet, but once you do they will live here.';

  @override
  String get tablesAddProducts => 'Add products';

  @override
  String get tablesDetails => 'Details';

  @override
  String get tablesRemoveFromTheChannel => 'Remove from the channel';

  @override
  String get tablesProducts => 'Products';

  @override
  String salesChannelsTablePlaceholderSelectedWithCountsOne(String count) {
    return '$count';
  }

  @override
  String salesChannelsTablePlaceholderSelectedWithCountsOther(String count) {
    return '$count';
  }

  @override
  String get tablesRemove => 'Remove';

  @override
  String get componentsSuccessfullyUpdatedCurrency =>
      'Successfully updated currency';

  @override
  String get componentsDefault => 'Default';

  @override
  String get defaultStoreCurrencySuccess => 'Success';

  @override
  String get defaultStoreCurrencySuccessfullyUpdatedDefaultCurrency =>
      'Successfully updated default currency';

  @override
  String get defaultStoreCurrencyError => 'Error';

  @override
  String get defaultStoreCurrencyDefaultStoreCurrency =>
      'Default store currency';

  @override
  String get defaultStoreCurrencyThisIsTheCurrencyYourPricesAreShownIn =>
      'This is the currency your prices are shown in.';

  @override
  String get storeCurrenciesSuccess => 'Success';

  @override
  String get storeCurrenciesSuccessfullyUpdatedCurrencies =>
      'Successfully updated currencies';

  @override
  String get storeCurrenciesError => 'Error';

  @override
  String get storeCurrenciesCancel => 'Cancel';

  @override
  String get storeCurrenciesSaveAndGoBack => 'Save and go back';

  @override
  String get storeCurrenciesSaveAndClose => 'Save and close';

  @override
  String get storeCurrenciesAddStoreCurrencies => 'Add Store Currencies';

  @override
  String get storeCurrenciesCurrentStoreCurrencies =>
      'Current Store Currencies';

  @override
  String get storeCurrenciesClose => 'Close';

  @override
  String currentCurrenciesScreenSelectedWithCountOne(String count) {
    return '$count';
  }

  @override
  String currentCurrenciesScreenSelectedWithCountOther(String count) {
    return '$count';
  }

  @override
  String get storeCurrenciesDeselect => 'Deselect';

  @override
  String get storeCurrenciesRemove => 'Remove';

  @override
  String get storeCurrenciesAddCurrencies => 'Add Currencies';

  @override
  String get storeCurrenciesStoreCurrencies => 'Store currencies';

  @override
  String get storeCurrenciesAllTheCurrenciesAvailableInYourStore =>
      'All the currencies available in your store.';

  @override
  String get storeCurrenciesEditCurrencies => 'Edit currencies';

  @override
  String get currenciesAnUnknownErrorOccurred => 'An unknown error occurred';

  @override
  String get currenciesError => 'Error';

  @override
  String get currenciesBackToSettings => 'Back to Settings';

  @override
  String get currenciesManageTheMarketsThatYouWillOperateWithin =>
      'Manage the markets that you will operate within.';

  @override
  String get currenciesIncludeOrExcludeTaxes =>
      'Decide if you want to include or exclude taxes whenever you define a price in this currency';

  @override
  String get currenciesTaxInclPrices => 'Tax Incl. Prices';

  @override
  String get settingsError => 'Error';

  @override
  String get settingsMalformedSwapUrl => 'Malformed swap url';

  @override
  String get settingsMalformedPaymentUrl => 'Malformed payment url';

  @override
  String get settingsMalformedInviteUrl => 'Malformed invite url';

  @override
  String get settingsSuccess => 'Success';

  @override
  String get settingsSuccessfullyUpdatedStore => 'Successfully updated store';

  @override
  String get settingsBackToSettings => 'Back to settings';

  @override
  String get settingsSave => 'Save';

  @override
  String get settingsCancel => 'Cancel';

  @override
  String get settingsStoreDetails => 'Store Details';

  @override
  String get settingsManageYourBusinessDetails =>
      'Manage your business details';

  @override
  String get settingsGeneral => 'General';

  @override
  String get settingsStoreName => 'Store name';

  @override
  String get settingsMedusaStore => 'Medusa Store';

  @override
  String get settingsAdvancedSettings => 'Advanced settings';

  @override
  String get settingsSwapLinkTemplate => 'Swap link template';

  @override
  String get settingsDraftOrderLinkTemplate => 'Draft order link template';

  @override
  String get settingsInviteLinkTemplate => 'Invite link template';

  @override
  String get settingsManageTheGeneralSettingsForYourStore =>
      'Manage the general settings for your store';

  @override
  String get settingsManageTheSettingsForYourStoreAposSExtensions =>
      'Manage the settings for your store extensions';

  @override
  String get editUserInformationSuccess => 'Success';

  @override
  String get editUserInformationYourInformationWasSuccessfullyUpdated =>
      'Your information was successfully updated';

  @override
  String get editUserInformationEditInformation => 'Edit information';

  @override
  String get editUserInformationCancel => 'Cancel';

  @override
  String get editUserInformationSubmitAndClose => 'Submit and close';

  @override
  String get personalInformationBackToSettings => 'Back to Settings';

  @override
  String get personalInformationPersonalInformation => 'Personal information';

  @override
  String get personalInformationManageYourMedusaProfile =>
      'Manage your Medusa profile';

  @override
  String get personalInformationLanguageSettingsTitle => 'Language';

  @override
  String get personalInformationLanguageSettingsDescription =>
      'Adjust the language of Medusa Admin';

  @override
  String get personalInformationLanguageSettingsHelpUsTranslate =>
      'Help us translate';

  @override
  String get personalInformationUsageInsightsTitle => 'Usage insights';

  @override
  String get usageInsightsDisabled => 'Disabled';

  @override
  String get usageInsightsActive => 'Active';

  @override
  String get usageInsightsShareUsageInsightsAndHelpUsImproveMedusa =>
      'Share usage insights and help us improve Medusa';

  @override
  String get usageInsightsEditPreferences => 'Edit preferences';

  @override
  String get usageInsightsSuccess => 'Success';

  @override
  String get usageInsightsYourInformationWasSuccessfullyUpdated =>
      'Your information was successfully updated';

  @override
  String get usageInsightsError => 'Error';

  @override
  String get usageInsightsCancel => 'Cancel';

  @override
  String get usageInsightsSubmitAndClose => 'Submit and close';

  @override
  String get regionFormTitle => 'Title';

  @override
  String get regionFormEurope => 'Europe';

  @override
  String get regionFormCurrencyCodeIsRequired => 'Currency code is required';

  @override
  String get regionFormCurrency => 'Currency';

  @override
  String get regionFormChooseCurrency => 'Choose currency';

  @override
  String get regionFormDefaultTaxRate => 'Default Tax Rate';

  @override
  String get regionFormTaxRateIsRequired => 'Tax rate is required';

  @override
  String get regionFormTaxRateMustBeEqualToOrLessThan100 =>
      'Tax rate must be equal to or less than 100';

  @override
  String get regionFormDefaultTaxCode => 'Default Tax Code';

  @override
  String get regionFormCountries => 'Countries';

  @override
  String get regionFormChooseCountries => 'Choose countries';

  @override
  String get regionFormTaxInclusivePrices => 'Tax inclusive prices';

  @override
  String get regionFormWhenEnabledRegionPricesWillBeTaxInclusive =>
      'When enabled region prices will be tax inclusive.';

  @override
  String get regionFormPaymentProvidersAreRequired =>
      'Payment providers are required';

  @override
  String get regionFormPaymentProviders => 'Payment Providers';

  @override
  String get regionFormChoosePaymentProviders => 'Choose payment providers...';

  @override
  String get regionFormFulfillmentProvidersAreRequired =>
      'Fulfillment providers are required';

  @override
  String get regionFormFulfillmentProviders => 'Fulfillment Providers';

  @override
  String get regionFormChooseFulfillmentProviders =>
      'Choose fulfillment providers...';

  @override
  String get shippingOptionCardSuccess => 'Success';

  @override
  String get shippingOptionCardShippingOptionUpdated =>
      'Shipping option updated';

  @override
  String get shippingOptionCardError => 'Error';

  @override
  String get shippingOptionCardEditShippingOption => 'Edit Shipping Option';

  @override
  String get shippingOptionCardFulfillmentMethod => 'Fulfillment Method';

  @override
  String get shippingOptionCardCancel => 'Cancel';

  @override
  String get shippingOptionCardSaveAndClose => 'Save and close';

  @override
  String get shippingOptionCardShippingOptionHasBeenDeleted =>
      'Shipping option has been deleted';

  @override
  String get shippingOptionCardFlatRate => 'Flat Rate';

  @override
  String get shippingOptionCardCalcualted => 'Calculated';

  @override
  String get shippingOptionCardMinSubtotal => 'Min. subtotal:';

  @override
  String get shippingOptionCardMaxSubtotal => 'Max. subtotal:';

  @override
  String get shippingOptionCardAdmin => 'Admin';

  @override
  String get shippingOptionCardStore => 'Store';

  @override
  String get shippingOptionCardEdit => 'Edit';

  @override
  String get shippingOptionCardDelete => 'Delete';

  @override
  String get shippingOptionFormVisibleInStore => 'Visible in store';

  @override
  String
      get shippingOptionFormEnableOrDisableTheShippingOptionVisiblityInStore =>
          'Enable or disable the shipping option visiblity in store.';

  @override
  String get shippingOptionFormDetails => 'Details';

  @override
  String get shippingOptionFormTitle => 'Title';

  @override
  String get shippingOptionFormTitleIsRequired => 'Title is required';

  @override
  String get shippingOptionFormPriceType => 'Price Type';

  @override
  String get shippingOptionFormFlatRate => 'Flat Rate';

  @override
  String get shippingOptionFormCalculated => 'Calculated';

  @override
  String get shippingOptionFormChooseAPriceType => 'Choose a price type';

  @override
  String get shippingOptionFormPrice => 'Price';

  @override
  String get shippingOptionFormShippingProfile => 'Shipping Profile';

  @override
  String get shippingOptionFormChooseAShippingProfile =>
      'Choose a shipping profile';

  @override
  String get shippingOptionFormFulfillmentMethod => 'Fulfillment Method';

  @override
  String get shippingOptionFormChooseAFulfillmentMethod =>
      'Choose a fulfillment method';

  @override
  String get shippingOptionFormRequirements => 'Requirements';

  @override
  String get shippingOptionFormMinSubtotalMustBeLessThanMaxSubtotal =>
      'Min. subtotal must be less than max. subtotal';

  @override
  String get shippingOptionFormMinSubtotal => 'Min. subtotal';

  @override
  String get shippingOptionFormMaxSubtotal => 'Max. subtotal';

  @override
  String get shippingOptionFormMetadata => 'Metadata';

  @override
  String get generalSectionSuccess => 'Success';

  @override
  String get generalSectionRegionWasSuccessfullyUpdated =>
      'Region was successfully updated';

  @override
  String get generalSectionError => 'Error';

  @override
  String get generalSectionEditRegionDetails => 'Edit Region Details';

  @override
  String get generalSectionDetails => 'Details';

  @override
  String get generalSectionProviders => 'Providers';

  @override
  String get generalSectionMetadata => 'Metadata';

  @override
  String get generalSectionCancel => 'Cancel';

  @override
  String get generalSectionSaveAndClose => 'Save and close';

  @override
  String get editSomethingWentWrong => 'Something went wrong...';

  @override
  String get editNoRegionFound =>
      'We can\'t find a region with that ID, use the menu to the left to select a region.';

  @override
  String get returnShippingOptionsSuccess => 'Success';

  @override
  String get returnShippingOptionsShippingOptionCreated =>
      'Shipping option created';

  @override
  String get returnShippingOptionsError => 'Error';

  @override
  String get returnShippingOptionsAddReturnShippingOption =>
      'Add Return Shipping Option';

  @override
  String get returnShippingOptionsCancel => 'Cancel';

  @override
  String get returnShippingOptionsSaveAndClose => 'Save and close';

  @override
  String get returnShippingOptionsReturnShippingOptions =>
      'Return Shipping Options';

  @override
  String get returnShippingOptionsAddOption => 'Add Option';

  @override
  String
      get returnShippingOptionsEnterSpecificsAboutAvailableRegionalReturnShipmentMethods =>
          'Enter specifics about available regional return shipment methods.';

  @override
  String get shippingOptionsSuccess => 'Success';

  @override
  String get shippingOptionsShippingOptionCreated => 'Shipping option created';

  @override
  String get shippingOptionsError => 'Error';

  @override
  String get shippingOptionsAddShippingOption => 'Add Shipping Option';

  @override
  String get shippingOptionsCancel => 'Cancel';

  @override
  String get shippingOptionsSaveAndClose => 'Save and close';

  @override
  String get shippingOptionsShippingOptions => 'Shipping Options';

  @override
  String get shippingOptionsAddOption => 'Add Option';

  @override
  String
      get shippingOptionsEnterSpecificsAboutAvailableRegionalShipmentMethods =>
          'Enter specifics about available regional shipment methods.';

  @override
  String get newRegionCreated => 'Region created';

  @override
  String get newCreateRegion => 'Create region';

  @override
  String get newDetails => 'Details';

  @override
  String get newAddTheRegionDetails => 'Add the region details.';

  @override
  String get newProviders => 'Providers';

  @override
  String get newAddWhichFulfillmentAndPaymentProvidersShouldBeAvailableInThisRegion =>
      'Add which fulfillment and payment providers should be available in this region.';

  @override
  String get regionOverviewRegions => 'Regions';

  @override
  String get regionOverviewManageTheMarketsThatYouWillOperateWithin =>
      'Manage the markets that you will operate within.';

  @override
  String get regionOverviewNotConfigured => 'Not configured';

  @override
  String get regionOverviewFulfillmentProviders => 'Fulfillment providers:';

  @override
  String get returnReasonsNotificationSuccess => 'Success';

  @override
  String get returnReasonsCreatedANewReturnReason =>
      'Created a new return reason';

  @override
  String get returnReasonsSuccess => 'success';

  @override
  String get returnReasonsError => 'Error';

  @override
  String get returnReasonsCannotCreateAReturnReasonWithAnExistingValue =>
      'Cannot create a return reason with an existing value';

  @override
  String get returnReasonsAddReason => 'Add Reason';

  @override
  String get returnReasonsValueIsRequired => 'Value is required';

  @override
  String get returnReasonsValue => 'Value';

  @override
  String get returnReasonsLabelIsRequired => 'Label is required';

  @override
  String get returnReasonsLabel => 'Label';

  @override
  String get returnReasonsDescription => 'Description';

  @override
  String get returnReasonsCustomerReceivedTheWrongSize =>
      'Customer received the wrong size';

  @override
  String get returnReasonsCancel => 'Cancel';

  @override
  String get returnReasonsCreate => 'Create';

  @override
  String get returnReasonsSuccessTitle => 'Success';

  @override
  String get returnReasonsSuccessfullyUpdatedReturnReason =>
      'Successfully updated return reason';

  @override
  String get returnReasonsDuplicateReason => 'Duplicate reason';

  @override
  String get returnReasonsDeleteReason => 'Delete reason';

  @override
  String get returnReasonsSave => 'Save';

  @override
  String get returnReasonsDetails => 'Details';

  @override
  String get returnReasonsDeleteReturnReason => 'Delete Return Reason';

  @override
  String get returnReasonsAreYouSureYouWantToDeleteThisReturnReason =>
      'Are you sure you want to delete this return reason?';

  @override
  String get returnReasonsBackToSettings => 'Back to settings';

  @override
  String get returnReasonsReturnReasons => 'Return Reasons';

  @override
  String get returnReasonsAddReasonLabel => 'Add reason';

  @override
  String get returnReasonsManageReasonsForReturnedItems =>
      'Manage reasons for returned items';

  @override
  String get taxesDetails => 'Details';

  @override
  String get taxesNewTaxRate => 'New Tax Rate';

  @override
  String get taxesTaxCalculationSettings => 'Tax Calculation Settings';

  @override
  String get taxesSuccess => 'Success';

  @override
  String get taxesSuccessfullyUpdatedTaxRate =>
      'Successfully updated Tax Rate.';

  @override
  String get taxesError => 'Error';

  @override
  String get taxesOverrides => 'Overrides';

  @override
  String get taxesProductRules => 'Product Rules';

  @override
  String taxesProductRulesDescriptionOne(String count) {
    return 'Applies to $count productWithCount';
  }

  @override
  String taxesProductRulesDescriptionOther(String count) {
    return 'Applies to $count productWithCount';
  }

  @override
  String get taxesProductTypeRules => 'Product Type Rules';

  @override
  String taxesProductTypeRulesDescriptionOne(String count) {
    return 'Applies to $count product typeWithCount';
  }

  @override
  String taxesProductTypeRulesDescriptionOther(String count) {
    return 'Applies to $count product typeWithCount';
  }

  @override
  String get taxesShippingOptionRules => 'Shipping Option Rules';

  @override
  String taxesAppliesToShippingOptionWithCountOne(String count) {
    return 'Applies to $count shipping optionWithCount';
  }

  @override
  String taxesAppliesToShippingOptionWithCountOther(String count) {
    return 'Applies to $count shipping optionWithCount';
  }

  @override
  String get taxesAddOverrides => 'Add Overrides';

  @override
  String get taxesCancel => 'Cancel';

  @override
  String get taxesSave => 'Save';

  @override
  String get taxesName => 'Name';

  @override
  String get taxesDefault => 'Default';

  @override
  String get taxesRateName => 'Rate name';

  @override
  String get taxesTaxRate => 'Tax Rate';

  @override
  String get taxesTaxCode => 'Tax Code';

  @override
  String get taxesEditTaxRate => 'Edit Tax Rate';

  @override
  String get taxesBackToSettings => 'Back to settings';

  @override
  String get taxesRegions => 'Regions';

  @override
  String get taxesSelectTheRegionYouWishToManageTaxesFor =>
      'Select the region you wish to manage taxes for';

  @override
  String get taxesGoToRegionSettings => 'Go to Region settings';

  @override
  String get taxesSuccessfullyCreatedTaxRate =>
      'Successfully created tax rate.';

  @override
  String get taxesAddTaxRate => 'Add Tax Rate';

  @override
  String taxesAppliesToProductTypeWithCountOne(String count) {
    return 'Applies to $count product typeWithCount';
  }

  @override
  String taxesAppliesToProductTypeWithCountOther(String count) {
    return 'Applies to $count product typeWithCount';
  }

  @override
  String get taxesCreate => 'Create';

  @override
  String get taxesSelectProducts => 'Select Products';

  @override
  String get taxesSelectProductTypesLabel => 'Select Product Types';

  @override
  String get taxesProductTypes => 'Product Types';

  @override
  String get taxesSystemTaxProvider => 'System Tax Provider';

  @override
  String get taxesRegionTaxSettingsWereSuccessfullyUpdated =>
      'Region tax settings were successfully updated.';

  @override
  String get taxesTaxProvider => 'Tax Provider';

  @override
  String get taxesCalculateTaxesAutomatically =>
      'Calculate taxes automatically?';

  @override
  String get taxesAutomaticallyApplyTaxCalculationsToCarts =>
      'When checked Medusa will automatically apply tax calculations to Carts in this Region. When unchecked you will have to manually compute taxes at checkout. Manual taxes are recommended if using a 3rd party tax provider to avoid performing too many requests';

  @override
  String get taxesApplyTaxToGiftCards => 'Apply tax to gift cards?';

  @override
  String get taxesApplyTaxesToGiftCards =>
      'When checked taxes will be applied to gift cards on checkout. In some contries tax regulations require that taxes are applied to gift cards on purchase.';

  @override
  String get taxesSearchProducts => 'Search Products..';

  @override
  String get taxesSelectShippingOption => 'Select Shipping Option';

  @override
  String get taxesShippingOptions => 'Shipping Options';

  @override
  String get taxesDeleteTaxRateHeading => 'Delete tax rate';

  @override
  String get taxesConfirmDelete =>
      'Are you sure you want to delete this tax rate?';

  @override
  String get taxesTaxRateWasDeleted => 'Tax rate was deleted.';

  @override
  String get taxesEdit => 'Edit';

  @override
  String get taxesDeleteTaxRate => 'Delete Tax Rate';

  @override
  String get taxesDeleteRule => 'Delete rule';

  @override
  String get taxesType => 'Type';

  @override
  String get taxesProducts => 'Products';

  @override
  String get taxesSelectIndividualProducts => 'Select individual products';

  @override
  String get taxesSelectProductTypes => 'Select product types';

  @override
  String get taxesSelectShippingOptions => 'Select shipping options';

  @override
  String get taxesBack => 'Back';

  @override
  String get taxesAdd => 'Add';

  @override
  String get taxesCode => 'Code';

  @override
  String get usersInviteUsers => 'Invite Users';

  @override
  String get usersBackToSettings => 'Back to settings';

  @override
  String get usersTheTeam => 'The Team';

  @override
  String get usersManageUsersOfYourMedusaStore =>
      'Manage users of your Medusa Store';

  @override
  String usersCountOne(String count) {
    return '$count';
  }

  @override
  String usersCountOther(String count) {
    return '$count';
  }
}
