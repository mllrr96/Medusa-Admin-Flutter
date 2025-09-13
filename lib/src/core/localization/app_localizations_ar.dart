// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get backButtonGoBack => 'رجوع';

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
    return 'متاح في $availableChannelsCount من $totalChannelsCount قنوات المبيعات';
  }

  @override
  String get activityDrawerActivity => 'النشاط';

  @override
  String get activityDrawerNoNotificationsTitle => 'هدوء هنا...';

  @override
  String get activityDrawerNoNotificationsDescription =>
      'ليس لديك أي إشعارات حاليًا ، ولكن بمجرد أن يكون لديك إشعارات ستظهر هنا.';

  @override
  String get activityDrawerErrorTitle => 'آه لا...';

  @override
  String get activityDrawerErrorDescription =>
      'حدث خطأ ما أثناء محاولة جلب إشعاراتك - سنواصل المحاولة!';

  @override
  String get activityDrawerProcessing => 'جار المعالجة...';

  @override
  String get analyticsConfigFormTitle =>
      'جعل بيانات الاستخدام الخاصة بي مجهولة الهوية';

  @override
  String get analyticsConfigFormDescription =>
      'يمكنك اختيار جعل بيانات استخدامك مجهولة الهوية. إذا تم تحديد هذا الخيار ، فلن نقوم بجمع معلوماتك الشخصية ، مثل اسمك وعنوان بريدك الإلكتروني.';

  @override
  String get analyticsConfigFormOptOut =>
      'عدم مشاركة بيانات الاستخدام الخاصة بي';

  @override
  String get analyticsConfigFormOptOutLater =>
      'يمكنك دائمًا اختيار عدم مشاركة بيانات الاستخدام الخاصة بك في أي وقت.';

  @override
  String get analyticsPreferencesSuccess => 'نجاح';

  @override
  String get analyticsPreferencesYourPreferencesWereSuccessfullyUpdated =>
      'تم تحديث تفضيلاتك بنجاح';

  @override
  String get analyticsPreferencesError => 'حدث خطأ';

  @override
  String get analyticsPreferencesHelpUsGetBetter => 'ساعدنا في التحسن';

  @override
  String get analyticsPreferencesDisclaimer =>
      'لإنشاء أكثر تجربة تجارة إلكترونية شيقة، نود الحصول على رؤى حول كيفية استخدامك لـ Medusa. تسمح لنا رؤى المستخدمين ببناء منتج أفضل وأكثر جاذبية وأكثر قابلية للاستخدام. نحن نجمع البيانات فقط لتحسين المنتجات. اقرأ البيانات التي نجمعها في';

  @override
  String get analyticsPreferencesDocumentation => 'وثائقنا';

  @override
  String get analyticsPreferencesPleaseEnterAValidEmail =>
      'الرجاء إدخال بريد إلكتروني صالح';

  @override
  String get analyticsPreferencesContinue => 'استمر';

  @override
  String get currencyInputCurrency => 'العملة';

  @override
  String get currencyInputAmountIsNotValid => 'المبلغ غير صالح';

  @override
  String get organismsSuccess => 'نجاح';

  @override
  String get organismsDeleteSuccessful => 'تم الحذف بنجاح';

  @override
  String get organismsAreYouSureYouWantToDelete =>
      'هل أنت متأكد أنك تريد الحذف؟';

  @override
  String get organismsNoCancel => 'لا، إلغاء';

  @override
  String get organismsYesRemove => 'نعم، إحذف';

  @override
  String get detailsCollapsibleHideAdditionalDetails =>
      'إخفاء التفاصيل الإضافية';

  @override
  String get detailsCollapsibleShowAdditionalDetails =>
      'إظهار التفاصيل الإضافية';

  @override
  String get editUserModalSuccess => 'نجاح';

  @override
  String get editUserModalUserWasUpdated => 'تم تحديث المستخدم';

  @override
  String get editUserModalError => 'حدث خطأ';

  @override
  String get editUserModalEditUser => 'تعديل المستخدم';

  @override
  String get editUserModalFirstNameLabel => 'الاسم الأول';

  @override
  String get editUserModalFirstNamePlaceholder => 'الاسم الأول...';

  @override
  String get editUserModalLastNameLabel => 'اسم العائلة';

  @override
  String get editUserModalLastNamePlaceholder => 'اسم العائلة...';

  @override
  String get editUserModalEmail => 'البريد الإلكتروني';

  @override
  String get editUserModalCancel => 'إلغاء';

  @override
  String get editUserModalSave => 'حفظ';

  @override
  String get errorBoundaryBackToDashboard => 'العودة إلى لوحة التحكم';

  @override
  String get errorBoundaryAnUnknownErrorOccured => 'حدث خطأ غير معروف';

  @override
  String get errorBoundaryBadRequest => 'طلب خاطئ';

  @override
  String get errorBoundaryYouAreNotLoggedIn => 'أنت غير مسجل الدخول';

  @override
  String get errorBoundaryYouDoNotHavePermissionPerformThisAction =>
      'ليس لديك إذن لتنفيذ هذا الإجراء';

  @override
  String get errorBoundaryPageWasNotFound => 'لم يتم العثور على الصفحة';

  @override
  String get errorBoundaryAnUnknownServerErrorOccured =>
      'حدث خطأ خادم غير معروف';

  @override
  String get errorBoundary503 => 'الخادم غير متاح حاليًا';

  @override
  String get errorBoundary500 =>
      'حدث خطأ بأسباب غير محددة، ومن المرجح أن يرجع ذلك إلى مشكلة فنية من جانبنا. يرجى تحديث الصفحة. إذا استمرت المشكلة، يرجى الاتصال بالمسؤول الخاص بك.';

  @override
  String get errorBoundary400 =>
      'الطلب غير صحيح، قم بإصلاح طلبك ثم حاول مرة أخرى.';

  @override
  String get errorBoundary401 =>
      'أنت غير مسجل الدخول ، يرجى تسجيل الدخول للمتابعة.';

  @override
  String get errorBoundary403 =>
      'ليس لديك إذن لتنفيذ هذا الإجراء ، إذا كنت تعتقد أن هذا خطأ ، اتصل بالمسؤول الخاص بك.';

  @override
  String get errorBoundary404 =>
      'لم يتم العثور على الصفحة التي طلبتها ، يرجى التحقق من عنوان الصفحة والمحاولة مرة أخرى.';

  @override
  String get errorBoundary5002 =>
      'لم يتمكن الخادم من التعامل مع طلبك ، وهذا في الغالب بسبب مشكلة فنية من جانبنا. يرجى المحاولة مرة أخرى. إذا استمرت المشكلة، اتصل بالمسؤول الخاص بك.';

  @override
  String get errorBoundary5032 =>
      'الخادم غير متوفر مؤقتًا ، ولم يتم معالجة طلبك. يرجى المحاولة مرة أخرى لاحقًا. إذا استمرت المشكلة، اتصل بالمسؤول الخاص بك.';

  @override
  String get exportModalTitle => 'قم بتهيئة تصدير لبياناتك';

  @override
  String get exportModalCancel => 'إلغاء';

  @override
  String get exportModalExport => 'تصدير';

  @override
  String get fileUploadModalUploadANewPhoto => 'تحميل صورة جديدة';

  @override
  String get giftCardBannerEdit => 'تعديل';

  @override
  String get giftCardBannerUnpublish => 'إلغاء النشر';

  @override
  String get giftCardBannerPublish => 'نشر';

  @override
  String get giftCardBannerDelete => 'حذف';

  @override
  String get giftCardBannerPublished => 'منشور';

  @override
  String get giftCardBannerUnpublished => 'غير منشور';

  @override
  String get giftCardDenominationsSectionDenominationAdded => 'تمت إضافة فئة';

  @override
  String get giftCardDenominationsSectionANewDenominationWasSuccessfullyAdded =>
      'تمت إضافة فئة جديدة بنجاح';

  @override
  String
      get giftCardDenominationsSectionADenominationWithThatDefaultValueAlreadyExists =>
          'توجد بالفعل فئة بهذه القيمة الافتراضية';

  @override
  String get giftCardDenominationsSectionError => 'حدث خطأ';

  @override
  String get giftCardDenominationsSectionAddDenomination => 'إضافة فئة';

  @override
  String get giftCardDenominationsSectionCancel => 'إلغاء';

  @override
  String get giftCardDenominationsSectionSaveAndClose => 'حفظ وإغلاق';

  @override
  String get giftCardDenominationsSectionDenominationUpdated =>
      'تم تحديث الفئة';

  @override
  String
      get giftCardDenominationsSectionANewDenominationWasSuccessfullyUpdated =>
          'تم تحديث فئة جديدة بنجاح';

  @override
  String get giftCardDenominationsSectionEditDenomination => 'تعديل الفئة';

  @override
  String get giftCardDenominationsSectionDenominations => 'الفئات';

  @override
  String get giftCardDenominationsSectionDenomination => 'الفئة';

  @override
  String get giftCardDenominationsSectionInOtherCurrencies => 'بعملات أخرى';

  @override
  String giftCardDenominationsSectionAndMoreOne(String count) {
    return ',$count أكثر';
  }

  @override
  String giftCardDenominationsSectionAndMoreOther(String count) {
    return ',$count أكثر';
  }

  @override
  String get giftCardDenominationsSectionDeleteDenomination => 'حذف الفئة';

  @override
  String get giftCardDenominationsSectionConfirmDelete =>
      'هل أنت متأكد أنك تريد حذف هذه الفئة؟';

  @override
  String get giftCardDenominationsSectionDenominationDeleted => 'تم حذف الفئة';

  @override
  String get giftCardDenominationsSectionDenominationWasSuccessfullyDeleted =>
      'تم حذف الفئة بنجاح';

  @override
  String get giftCardDenominationsSectionEdit => 'تعديل';

  @override
  String get giftCardDenominationsSectionDelete => 'حذف';

  @override
  String get helpDialogHowCanWeHelp => 'كيف يمكننا مساعدتك؟';

  @override
  String get helpDialogWeUsuallyRespondInAFewHours =>
      'عادةً نرد خلال بضع ساعات';

  @override
  String get helpDialogSubject => 'الموضوع';

  @override
  String get helpDialogWhatIsItAbout => 'عن ماذا الموضوع؟...';

  @override
  String get helpDialogWriteAMessage => 'اكتب رسالة...';

  @override
  String get helpDialogFeelFreeToJoinOurCommunityOf =>
      'لا تتردد في الانضمام إلى مجتمعنا من';

  @override
  String get helpDialogMerchantsAndECommerceDevelopers =>
      'التجار ومطوري التجارة الإلكترونية';

  @override
  String get helpDialogSendAMessage => 'إرسال رسالة';

  @override
  String get inviteModalSuccess => 'نجاح';

  @override
  String inviteModalInvitationSentTo(String user) {
    return 'تم إرسال الدعوة إلى $user';
  }

  @override
  String get inviteModalError => 'حدث خطأ';

  @override
  String get inviteModalMember => 'عضو';

  @override
  String get inviteModalAdmin => 'مدير';

  @override
  String get inviteModalDeveloper => 'مطور';

  @override
  String get inviteModalInviteUsers => 'إدعو مستخدمين';

  @override
  String get inviteModalEmail => 'البريد الإلكتروني';

  @override
  String get inviteModalRole => 'الدور';

  @override
  String get inviteModalSelectRole => 'حدد دور';

  @override
  String get inviteModalCancel => 'إلغاء';

  @override
  String get inviteModalInvite => 'دعوة';

  @override
  String get loginCardNoMatch => 'هذه البيانات غير مطابقة لسجلاتنا.';

  @override
  String get loginCardLogInToMedusa => 'تسجيل الدخول إلى Medusa';

  @override
  String get loginCardEmail => 'البريد الإلكتروني';

  @override
  String get loginCardPassword => 'كلمة المرور';

  @override
  String get loginCardForgotYourPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get metadataAddMetadata => 'إضافة بيانات وصفية';

  @override
  String get productAttributesSectionEditAttributes => 'تحرير السمات';

  @override
  String get productAttributesSectionDimensions => 'الأبعاد';

  @override
  String
      get productAttributesSectionConfigureToCalculateTheMostAccurateShippingRates =>
          'قم بالتهيئة لحساب معدلات الشحن بأكثر دقة';

  @override
  String get productAttributesSectionCustoms => 'الجمارك';

  @override
  String get productAttributesSectionCancel => 'إلغاء';

  @override
  String get productAttributesSectionSave => 'حفظ';

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
  String get productAttributesSectionMidCode => 'رمز MID';

  @override
  String get productAttributesSectionHsCode => 'رمز HS';

  @override
  String get productAttributesSectionCountryOfOrigin => 'بلد المنشأ';

  @override
  String get productGeneralSectionSuccess => 'نجاح';

  @override
  String get productGeneralSectionSuccessfullyUpdatedSalesChannels =>
      'تم تحديث قنوات المبيعات بنجاح';

  @override
  String get productGeneralSectionError => 'حدث خطأ';

  @override
  String get productGeneralSectionFailedToUpdateSalesChannels =>
      'فشل تحديث قنوات المبيعات';

  @override
  String get productGeneralSectionEditGeneralInformation =>
      'تحرير المعلومات العامة';

  @override
  String get productGeneralSectionGiftCard => 'بطاقة هدايا';

  @override
  String get productGeneralSectionProduct => 'المنتج';

  @override
  String get productGeneralSectionMetadata => 'البيانات الوصفية';

  @override
  String get productGeneralSectionCancel => 'إلغاء';

  @override
  String get productGeneralSectionSave => 'حفظ';

  @override
  String get productGeneralSectionDelete => 'حذف';

  @override
  String get productGeneralSectionEditSalesChannels => 'تحرير قنوات المبيعات';

  @override
  String get productGeneralSectionPublished => 'منشور';

  @override
  String get productGeneralSectionDraft => 'مسودة';

  @override
  String get productGeneralSectionDetails => 'التفاصيل';

  @override
  String get productGeneralSectionSubtitle => 'العنوان الفرعي';

  @override
  String get productGeneralSectionHandle => 'المُعالج';

  @override
  String get productGeneralSectionType => 'النوع';

  @override
  String get productGeneralSectionCollection => 'المجموعة';

  @override
  String get productGeneralSectionCategory => 'الفئة';

  @override
  String get productGeneralSectionPromotionable => 'Promotionable';

  @override
  String get productGeneralSectionTrue => 'صحيح';

  @override
  String get productGeneralSectionFalse => 'حدث خطأ';

  @override
  String productGeneralSectionCountOne(String count) {
    return '$count';
  }

  @override
  String productGeneralSectionCountOther(String count) {
    return '$count';
  }

  @override
  String get productGeneralSectionSalesChannels => 'قنوات المبيعات';

  @override
  String get productMediaSectionEditMedia => 'تحرير الوسائط';

  @override
  String get productMediaSectionUploadImagesError =>
      'حدث خطأ ما أثناء محاولة تحميل الصور.';

  @override
  String get productMediaSectionFileServiceNotConfigured =>
      'قد لا يكون لديك خدمة ملفات مهيأة. يرجى الاتصال بالمسؤول الخاص بك';

  @override
  String get productMediaSectionError => 'حدث خطأ';

  @override
  String get productMediaSectionMedia => 'الوسائط';

  @override
  String get productMediaSectionAddImagesToYourProduct =>
      'إضافة صور إلى منتجك.';

  @override
  String get productMediaSectionCancel => 'إلغاء';

  @override
  String get productMediaSectionSaveAndClose => 'حفظ وإغلاق';

  @override
  String get productRawSectionRawGiftCard => 'بطاقة هدايا خام';

  @override
  String get productRawSectionRawProduct => 'منتج خام';

  @override
  String get productThumbnailSectionSuccess => 'نجاح';

  @override
  String get productThumbnailSectionSuccessfullyDeletedThumbnail =>
      'تم حذف الصورة المصغرة بنجاح';

  @override
  String get productThumbnailSectionError => 'حدث خطأ';

  @override
  String get productThumbnailSectionEdit => 'تحرير';

  @override
  String get productThumbnailSectionUpload => 'تحميل';

  @override
  String get productThumbnailSectionUploadThumbnailError =>
      'حدث خطأ ما أثناء محاولة تحميل الصورة المصغرة.';

  @override
  String
      get productThumbnailSectionYouMightNotHaveAFileServiceConfiguredPleaseContactYourAdministrator =>
          'قد لا يكون لديك خدمة ملفات مهيأة. يرجى الاتصال بالمسؤول الخاص بك';

  @override
  String get productThumbnailSectionUploadThumbnail => 'تحميل الصورة المصغرة';

  @override
  String get productThumbnailSectionThumbnail => 'الصورة المصغرة';

  @override
  String get productThumbnailSectionUsedToRepresentYourProductDuringCheckoutSocialSharingAndMore =>
      'تُستخدم لتمثيل منتجك أثناء الدفع ومشاركة وسائل التواصل الاجتماعي وغيرها.';

  @override
  String get productThumbnailSectionCancel => 'إلغاء';

  @override
  String get productThumbnailSectionSaveAndClose => 'حفظ وإغلاق';

  @override
  String productVariantTreeCountOne(String count) {
    return '$count';
  }

  @override
  String productVariantTreeCountOther(String count) {
    return '$count';
  }

  @override
  String get productVariantTreeAddPrices => 'إضافة أسعار';

  @override
  String get productVariantsSectionAddVariant => 'إضافة متغير';

  @override
  String get productVariantsSectionCancel => 'إلغاء';

  @override
  String get productVariantsSectionSaveAndClose => 'حفظ وإغلاق';

  @override
  String get productVariantsSectionEditStockInventory => 'تحرير المخزون والجرد';

  @override
  String get productVariantsSectionEditVariant => 'تحرير المتغير';

  @override
  String get editVariantsModalCancel => 'إلغاء';

  @override
  String get editVariantsModalSaveAndGoBack => 'حفظ والعودة';

  @override
  String get editVariantsModalSaveAndClose => 'حفظ وإغلاق';

  @override
  String get editVariantsModalEditVariant => 'تحرير المتغير';

  @override
  String get editVariantsModalUpdateSuccess => 'تم تحديث المتغيرات بنجاح';

  @override
  String get editVariantsModalEditVariants => 'تحرير المتغيرات';

  @override
  String get editVariantsModalProductVariants => 'متغيرات المنتج';

  @override
  String get editVariantsModalVariant => 'المتغير';

  @override
  String get editVariantsModalInventory => 'المخزون';

  @override
  String get productVariantsSectionEditPrices => 'تحرير الأسعار';

  @override
  String get productVariantsSectionEditVariants => 'تحرير المتغيرات';

  @override
  String get productVariantsSectionEditOptions => 'تحرير الخيارات';

  @override
  String get productVariantsSectionProductVariants => 'متغيرات المنتج';

  @override
  String get productVariantsSectionError => 'حدث خطأ';

  @override
  String get productVariantsSectionFailedToUpdateProductOptions =>
      'فشل تحديث خيارات المنتج';

  @override
  String get productVariantsSectionSuccess => 'نجاح';

  @override
  String get productVariantsSectionSuccessfullyUpdatedProductOptions =>
      'تم تحديث خيارات المنتج بنجاح';

  @override
  String get productVariantsSectionProductOptions => 'خيارات المنتج';

  @override
  String get productVariantsSectionOptionTitle => 'عنوان الخيار';

  @override
  String get productVariantsSectionOptionTitleIsRequired =>
      'عنوان الخيار مطلوب';

  @override
  String get productVariantsSectionAddAnOption => 'إضافة خيار';

  @override
  String get productVariantsSectionInventory => 'المخزون';

  @override
  String get productVariantsSectionTitle => 'العنوان';

  @override
  String get productVariantsSectionSku => 'رمز المنتج';

  @override
  String get productVariantsSectionEan => 'رمز EAN';

  @override
  String get productVariantsSectionManageInventory => 'إدارة المخزون';

  @override
  String get productVariantsSectionDuplicateVariant => 'تكرار المتغير';

  @override
  String get productVariantsSectionDeleteVariantLabel => 'حذف المتغير';

  @override
  String get productVariantsSectionYesDelete => 'نعم، احذف';

  @override
  String get productVariantsSectionDeleteVariantHeading => 'حذف المتغير';

  @override
  String get productVariantsSectionConfirmDelete =>
      'هل أنت متأكد أنك تريد حذف هذا المتغير؟';

  @override
  String
      get productVariantsSectionNoteDeletingTheVariantWillAlsoRemoveInventoryItemsAndLevels =>
          'ملاحظة: سيؤدي حذف المتغير أيضًا إلى إزالة عناصر المخزون والمستويات';

  @override
  String get resetTokenCardError => 'حدث خطأ';

  @override
  String get resetTokenCardResetYourPassword =>
      'إعادة تعيين كلمة المرور الخاصة بك';

  @override
  String get resetTokenCardPasswordResetDescription =>
      'أدخل عنوان بريدك الإلكتروني أدناه ، وسنرسل لك <1></1> تعليمات حول كيفية إعادة تعيين <3></3> كلمة مرورك.';

  @override
  String get resetTokenCardEmail => 'البريد الإلكتروني';

  @override
  String get resetTokenCardThisIsNotAValidEmail =>
      'هذا ليس بريدًا إلكترونيًا صالحًا';

  @override
  String get resetTokenCardSendResetInstructions =>
      'إرسال تعليمات إعادة التعيين';

  @override
  String get resetTokenCardSuccessfullySentYouAnEmail =>
      'تم إرسال رسالة بريد إلكتروني إليك بنجاح';

  @override
  String get resetTokenCardGoBackToSignIn => 'العودة إلى تسجيل الدخول';

  @override
  String get rmaReturnProductTableProductDetails => 'تفاصيل المنتج';

  @override
  String get rmaReturnProductTableQuantity => 'الكمية';

  @override
  String get rmaSelectProductTableProductDetails => 'تفاصيل المنتج';

  @override
  String get rmaSelectProductTableQuantity => 'الكمية';

  @override
  String get rmaSelectProductTableRefundable => 'قابل للاسترداد';

  @override
  String rmaSelectProductTableImagesWitchCountOne(String count) {
    return 'count';
  }

  @override
  String rmaSelectProductTableImagesWitchCountOther(String count) {
    return '$count';
  }

  @override
  String get rmaSelectProductTableSelectReason => 'حدد سبب';

  @override
  String get sidebarStore => 'المتجر';

  @override
  String get sidebarOrders => 'الطلبات';

  @override
  String get sidebarProducts => 'المنتجات';

  @override
  String get sidebarCategories => 'الفئات';

  @override
  String get sidebarCustomers => 'العملاء';

  @override
  String get sidebarInventory => 'المخزون';

  @override
  String get sidebarPromotions => 'العروض الترويجية';

  @override
  String get sidebarGiftCards => 'بطاقات الهدايا';

  @override
  String get sidebarPricing => 'التسعير';

  @override
  String get sidebarSettings => 'الإعدادات';

  @override
  String tableContainerSoothedOffsetOne(
      String soothedOffset, String pageSize, String count, String title) {
    return '$soothedOffset - $pageSize من $count $title';
  }

  @override
  String tableContainerSoothedOffsetOther(
      String soothedOffset, String pageSize, String count, String title) {
    return '$soothedOffset - $pageSize من $count $title';
  }

  @override
  String tableContainerCurrentPage(
      String currentPage, String soothedPageCount) {
    return '$currentPage من $soothedPageCount';
  }

  @override
  String get timelineRequestReturn => 'طلب استرجاع';

  @override
  String get timelineRegisterExchange => 'تسجيل مبادلة';

  @override
  String get timelineRegisterClaim => 'تسجيل مطالبة';

  @override
  String get timelineSuccess => 'نجاح';

  @override
  String get timelineAddedNote => 'تمت إضافة ملاحظة';

  @override
  String get timelineError => 'حدث خطأ';

  @override
  String get timelineTimeline => 'الجدول الزمني';

  @override
  String get uploadModalNew => 'جديد';

  @override
  String get uploadModalUpdates => 'التحديثات';

  @override
  String get uploadModalDropYourFileHereOr => 'أسقط ملفك هنا أو';

  @override
  String get uploadModalClickToBrowse => 'انقر للتصفح.';

  @override
  String get uploadModalOnlyCsvFilesAreSupported => 'يتم فقط دعم ملفات CSV.';

  @override
  String uploadModalImportFileTitle(String fileTitle) {
    return 'استيراد $fileTitle';
  }

  @override
  String get uploadModalCancel => 'إلغاء';

  @override
  String get uploadModalImportList => 'استيراد قائمة';

  @override
  String get addProductsModalAddProducts => 'إضافة منتجات';

  @override
  String get addProductsModalSearchByNameOrDescription =>
      'البحث بالاسم أو الوصف...';

  @override
  String get addProductsModalCancel => 'إلغاء';

  @override
  String get addProductsModalSave => 'حفظ';

  @override
  String get addProductsModalProductDetails => 'تفاصيل المنتج';

  @override
  String get addProductsModalStatus => 'الحالة';

  @override
  String get addProductsModalVariants => 'المتغيرات';

  @override
  String get templatesGeneral => 'عام';

  @override
  String get templatesFirstName => 'الاسم الأول';

  @override
  String get templatesLastName => 'اسم العائلة';

  @override
  String get templatesCompany => 'الشركة';

  @override
  String get templatesPhone => 'هاتف';

  @override
  String get templatesBillingAddress => 'عنوان الفوترة';

  @override
  String get templatesShippingAddress => 'عنوان الشحن';

  @override
  String get templatesAddress => 'العنوان';

  @override
  String get templatesAddress1 => 'العنوان 1';

  @override
  String get templatesAddress2 => 'العنوان 2';

  @override
  String get templatesPostalCode => 'الرمز البريدي';

  @override
  String get templatesCity => 'المدينة';

  @override
  String get templatesProvince => 'المحافظة';

  @override
  String get templatesCountry => 'البلد';

  @override
  String get templatesMetadata => 'البيانات الوصفية';

  @override
  String get collectionModalSuccess => 'نجاح';

  @override
  String get collectionModalSuccessfullyUpdatedCollection =>
      'تم تحديث المجموعة بنجاح';

  @override
  String get collectionModalError => 'حدث خطأ';

  @override
  String get collectionModalSuccessfullyCreatedCollection =>
      'تم إنشاء المجموعة بنجاح';

  @override
  String get collectionModalEditCollection => 'تعديل المجموعة';

  @override
  String get collectionModalAddCollection => 'إضافة مجموعة';

  @override
  String get collectionModalDescription =>
      'لإنشاء مجموعة ، كل ما تحتاجه هو عنوان ومعالج.';

  @override
  String get collectionModalDetails => 'التفاصيل';

  @override
  String get collectionModalTitleLabel => 'العنوان';

  @override
  String get collectionModalTitlePlaceholder => 'النظارات الشمسية';

  @override
  String get collectionModalHandleLabel => 'المُعالج';

  @override
  String get collectionModalHandlePlaceholder => 'النظارات الشمسية';

  @override
  String get collectionModalSlugDescription =>
      'عنوان الصفحة للمجموعة. سيتم إنشاؤه تلقائيًا إذا ترك فارغًا.';

  @override
  String get collectionModalMetadata => 'البيانات الوصفية';

  @override
  String get collectionModalCancel => 'إلغاء';

  @override
  String get collectionModalSaveCollection => 'حفظ المجموعة';

  @override
  String get collectionModalPublishCollection => 'نشر المجموعة';

  @override
  String get collectionProductTableAddProducts => 'إضافة منتجات';

  @override
  String get collectionProductTableProducts => 'المنتجات';

  @override
  String get collectionProductTableSearchProducts => 'البحث عن منتجات';

  @override
  String get collectionProductTableCancel => 'إلغاء';

  @override
  String get collectionProductTableSave => 'حفظ';

  @override
  String get collectionProductTableSortBy => 'الترتيب حسب';

  @override
  String get collectionProductTableAll => 'الكل';

  @override
  String get collectionProductTableNewest => 'الأحدث';

  @override
  String get collectionProductTableOldest => 'الأقدم';

  @override
  String get collectionProductTableTitle => 'العنوان';

  @override
  String get collectionProductTableDecideStatusPublished => 'منشور';

  @override
  String get collectionProductTableDraft => 'مسودة';

  @override
  String get collectionProductTableProposed => 'مقترح';

  @override
  String get collectionProductTableRejected => 'مرفوض';

  @override
  String get collectionProductTableRemoveProductFromCollection =>
      'إزالة المنتج من المجموعة';

  @override
  String get collectionProductTableProductRemovedFromCollection =>
      'تمت إزالة المنتج من المجموعة';

  @override
  String get collectionsTableDeleteCollection => 'حذف المجموعة';

  @override
  String get collectionsTableConfirmDelete =>
      'هل أنت متأكد من أنك تريد حذف هذه المجموعة؟';

  @override
  String get collectionsTableEdit => 'تعديل';

  @override
  String get collectionsTableDelete => 'حذف';

  @override
  String get collectionsTableTitle => 'العنوان';

  @override
  String get collectionsTableHandle => 'المُعالج';

  @override
  String get collectionsTableCreatedAt => 'تم إنشاؤه في';

  @override
  String get collectionsTableUpdatedAt => 'تم تحديثه في';

  @override
  String get collectionsTableProducts => 'المنتجات';

  @override
  String get customerGroupTableDetails => 'التفاصيل';

  @override
  String get customerGroupTableDelete => 'حذف';

  @override
  String get customerGroupTableSuccess => 'نجاح';

  @override
  String get customerGroupTableGroupDeleted => 'تم حذف المجموعة';

  @override
  String get customerGroupTableError => 'حدث خطأ';

  @override
  String get customerGroupTableFailedToDeleteTheGroup => 'فشل حذف المجموعة';

  @override
  String get customerGroupTableCustomerGroups => 'مجموعات العملاء';

  @override
  String get customerGroupTableDeleteFromTheGroup => 'حذف من المجموعة';

  @override
  String get customerGroupTableCustomerGroupsTitle => 'مجموعات العملاء';

  @override
  String get customerGroupTableGroups => 'المجموعات';

  @override
  String get customerGroupTableAll => 'الكل';

  @override
  String get customerGroupTableEditCustomers => 'تعديل العملاء';

  @override
  String get customerGroupTableCustomers => 'العملاء';

  @override
  String get customerGroupTableCancel => 'إلغاء';

  @override
  String get customerGroupTableSave => 'حفظ';

  @override
  String get customerOrdersTableOrders => 'الطلبات';

  @override
  String get customerOrdersTableTransferOrder => 'تحويل الطلب';

  @override
  String get customerOrdersTablePaid => 'مدفوع';

  @override
  String get customerOrdersTableAwaiting => 'في انتظار';

  @override
  String get customerOrdersTableRequiresAction => 'يتطلب إجراء';

  @override
  String get customerOrdersTableNA => 'غير متوفر';

  @override
  String get customerOrdersTableFulfilled => 'تم تنفيذه';

  @override
  String get customerOrdersTableShipped => 'تم الشحن';

  @override
  String get customerOrdersTableNotFulfilled => 'لم يتم تنفيذه';

  @override
  String get customerOrdersTablePartiallyFulfilled => 'تم تنفيذه جزئياً';

  @override
  String get customerOrdersTablePartiallyShipped => 'تم شحنه جزئياً';

  @override
  String get customerOrdersTableOrder => 'الطلب';

  @override
  String customerOrdersTableRemainderMore(String remainder) {
    return '+ $remainder أكثر';
  }

  @override
  String get customerOrdersTableDate => 'التاريخ';

  @override
  String get customerOrdersTableFulfillment => 'التنفيذ';

  @override
  String get customerOrdersTableStatus => 'الحالة';

  @override
  String get customerOrdersTableTotal => 'المجموع';

  @override
  String get customerTableCustomers => 'العملاء';

  @override
  String get customerTableEdit => 'تعديل';

  @override
  String get customerTableDetails => 'التفاصيل';

  @override
  String get customerTableDateAdded => 'تاريخ الإضافة';

  @override
  String get customerTableName => 'الاسم';

  @override
  String get customerTableEmail => 'البريد الإلكتروني';

  @override
  String get customerTableOrders => 'الطلبات';

  @override
  String get promotionFilterDropdownFilters => 'الفلاتر';

  @override
  String get promotionTablePromotions => 'العروض الترويجية';

  @override
  String get promotionTableSearchByCodeOrDescription =>
      'البحث بالرمز أو الوصف...';

  @override
  String get promotionTableSuccess => 'نجاح';

  @override
  String get promotionTableSuccessfullyCopiedPromotion =>
      'تم نسخ العرض الترويجي بنجاح';

  @override
  String get promotionTableError => 'حدث خطأ';

  @override
  String get promotionTableScheduled => 'مجدول';

  @override
  String get promotionTableExpired => 'منتهية الصلاحية';

  @override
  String get promotionTableActive => 'نشط';

  @override
  String get promotionTableDisabled => 'معطل';

  @override
  String get promotionTableFreeShipping => 'شحن مجاني';

  @override
  String get promotionTableCode => 'الرمز';

  @override
  String get promotionTableDescription => 'الوصف';

  @override
  String get promotionTableAmount => 'المبلغ';

  @override
  String get promotionTableStatus => 'الحالة';

  @override
  String get promotionTableRedemptions => 'استردادات';

  @override
  String get promotionTableDeletePromotion => 'حذف العرض الترويجي';

  @override
  String get promotionTableConfirmDelete =>
      'هل أنت متأكد أنك تريد حذف هذا العرض الترويجي؟';

  @override
  String get promotionTablePublish => 'نشر';

  @override
  String get promotionTableUnpublish => 'إلغاء النشر';

  @override
  String get promotionTableSuccessfullyPublishedPromotion =>
      'تم نشر العرض الترويجي بنجاح';

  @override
  String get promotionTableSuccessfullyUnpublishedPromotion =>
      'تم إلغاء نشر العرض الترويجي بنجاح';

  @override
  String get promotionTableDuplicate => 'تكرار';

  @override
  String get promotionTableDelete => 'حذف';

  @override
  String get draftOrderTableDraftOrders => 'مسودات الطلبات';

  @override
  String get draftOrderTableCompleted => 'مكتمل';

  @override
  String get draftOrderTableOpen => 'مفتوح';

  @override
  String get draftOrderTableDraft => 'مسودة';

  @override
  String get draftOrderTableOrder => 'الطلب';

  @override
  String get draftOrderTableDateAdded => 'تاريخ الإضافة';

  @override
  String get draftOrderTableCustomer => 'العميل';

  @override
  String get draftOrderTableStatus => 'الحالة';

  @override
  String get giftCardFilterDropdownIsInTheLast => 'في الأخير';

  @override
  String get giftCardFilterDropdownIsOlderThan => 'أقدم من';

  @override
  String get giftCardFilterDropdownIsAfter => 'بعد';

  @override
  String get giftCardFilterDropdownIsBefore => 'قبل';

  @override
  String get giftCardFilterDropdownIsEqualTo => 'يساوي';

  @override
  String get giftCardFilterDropdownFilters => 'الفلاتر';

  @override
  String get giftCardFilterDropdownStatus => 'الحالة';

  @override
  String get giftCardFilterDropdownPaymentStatus => 'حالة الدفع';

  @override
  String get giftCardFilterDropdownFulfillmentStatus => 'حالة التنفيذ';

  @override
  String get giftCardFilterDropdownDate => 'التاريخ';

  @override
  String get giftCardTableGiftCards => 'بطاقات الهدايا';

  @override
  String get giftCardTableCode => 'الرمز';

  @override
  String get giftCardTableOrder => 'الطلب';

  @override
  String get giftCardTableOriginalAmount => 'المبلغ الأصلي';

  @override
  String get giftCardTableBalance => 'الرصيد';

  @override
  String get giftCardTableRegionHasBeenDeleted => 'تم حذف المنطقة';

  @override
  String get giftCardTableNone => 'لا شيء';

  @override
  String get giftCardTableCreated => 'تم إنشاؤه';

  @override
  String get imageTableFileName => 'اسم الملف';

  @override
  String get imageTableThumbnail => 'الصورة المصغرة';

  @override
  String get imageTableSelectThumbnailImageForProduct =>
      'حدد الصورة التي تريد استخدامها كصورة مصغرة لهذا المنتج';

  @override
  String get inventoryTableInventoryItems => 'عناصر المخزون';

  @override
  String get inventoryTableActionsAdjustAvailability => 'تعديل التوفر';

  @override
  String get inventoryTableViewProduct => 'عرض المنتج';

  @override
  String get inventoryTableSuccess => 'نجاح';

  @override
  String get inventoryTableInventoryItemUpdatedSuccessfully =>
      'تم تحديث عنصر المخزون بنجاح';

  @override
  String get inventoryTableAdjustAvailability => 'تعديل التوفر';

  @override
  String get inventoryTableCancel => 'إلغاء';

  @override
  String get inventoryTableSaveAndClose => 'حفظ وإغلاق';

  @override
  String get inventoryTableItem => 'العنصر';

  @override
  String get inventoryTableVariant => 'المتغير';

  @override
  String get inventoryTableSku => 'رمز المنتج';

  @override
  String get inventoryTableReserved => 'محجوز';

  @override
  String get inventoryTableInStock => 'متوفر';

  @override
  String get orderFilterDropdownFilters => 'الفلاتر';

  @override
  String get orderFilterDropdownStatus => 'الحالة';

  @override
  String get orderFilterDropdownPaymentStatus => 'حالة الدفع';

  @override
  String get orderFilterDropdownFulfillmentStatus => 'حالة التنفيذ';

  @override
  String get orderFilterDropdownRegions => 'المناطق';

  @override
  String get orderFilterDropdownSalesChannel => 'قناة المبيعات';

  @override
  String get orderFilterDropdownDate => 'التاريخ';

  @override
  String get orderTablePaid => 'مدفوع';

  @override
  String get orderTableAwaiting => 'في انتظار';

  @override
  String get orderTableRequiresAction => 'يتطلب إجراء';

  @override
  String get orderTableCanceled => 'ألغيت';

  @override
  String get orderTableNA => 'غير متوفر';

  @override
  String get orderTableOrder => 'الطلب';

  @override
  String get orderTableDateAdded => 'تاريخ الإضافة';

  @override
  String get orderTableCustomer => 'العميل';

  @override
  String get orderTableFulfillment => 'التنفيذ';

  @override
  String get orderTablePaymentStatus => 'حالة الدفع';

  @override
  String get orderTableSalesChannel => 'قناة المبيعات';

  @override
  String get orderTableTotal => 'المجموع';

  @override
  String get orderTableFiltersComplete => 'مكتمل';

  @override
  String get orderTableFiltersIncomplete => 'غير مكتمل';

  @override
  String get priceListTableFilters => 'الفلاتر';

  @override
  String get priceListTableStatus => 'الحالة';

  @override
  String get priceListTableType => 'النوع';

  @override
  String get priceListTablePriceLists => 'قوائم الأسعار';

  @override
  String get priceListTableSuccess => 'نجاح';

  @override
  String get priceListTableSuccessfullyCopiedPriceList =>
      'تم نسخ قائمة الأسعار بنجاح';

  @override
  String get priceListTableError => 'حدث خطأ';

  @override
  String get priceListTableDeletePriceList => 'حذف قائمة الأسعار';

  @override
  String get priceListTableConfirmDelete => 'هل أنت متأكد من حذف هذه القائمة؟';

  @override
  String get priceListTableSuccessfullyDeletedThePriceList =>
      'تم حذف قائمة الأسعار بنجاح';

  @override
  String get priceListTableSuccessfullyUnpublishedPriceList =>
      'تم إلغاء نشر قائمة الأسعار بنجاح';

  @override
  String get priceListTableSuccessfullyPublishedPriceList =>
      'تم نشر قائمة الأسعار بنجاح';

  @override
  String get priceListTableUnpublish => 'إلغاء النشر';

  @override
  String get priceListTablePublish => 'نشر';

  @override
  String get priceListTableDelete => 'حذف';

  @override
  String get priceListTableName => 'الاسم';

  @override
  String get priceListTableDescription => 'الوصف';

  @override
  String get priceListTableGroups => 'المجموعات';

  @override
  String priceListTableOtherMore(String other) {
    return '+ $other أكثر';
  }

  @override
  String get priceOverridesApplyOverridesOnSelectedVariants =>
      'تطبيق التجاوزات على المتغيرات المحددة';

  @override
  String get priceOverridesApplyOnAllVariants => 'التطبيق على جميع المتغيرات';

  @override
  String get priceOverridesPrices => 'الأسعار';

  @override
  String get priceOverridesCancel => 'إلغاء';

  @override
  String get priceOverridesSaveAndClose => 'حفظ وإغلاق';

  @override
  String get priceOverridesShowRegions => 'إظهار المناطق';

  @override
  String get productTableProducts => 'المنتجات';

  @override
  String get productTableCopySuccess => 'نجاح';

  @override
  String get productTableCopyCreatedANewProduct => 'تم إنشاء منتج جديد';

  @override
  String get productTableCopyError => 'حدث خطأ';

  @override
  String get productTableDeleteProduct => 'حذف المنتج';

  @override
  String get productTableConfirmDelete => 'هل أنت متأكد من حذف هذا المنتج؟';

  @override
  String get productTableEdit => 'تعديل';

  @override
  String get productTableUnpublish => 'إلغاء النشر';

  @override
  String get productTablePublish => 'نشر';

  @override
  String get productTableDraft => 'مسودة';

  @override
  String get productTablePublished => 'منشور';

  @override
  String get productTableSuccess => 'نجاح';

  @override
  String get productTableSuccessfullyUnpublishedProduct =>
      'تم إلغاء نشر المنتج بنجاح';

  @override
  String get productTableSuccessfullyPublishedProduct => 'تم نشر المنتج بنجاح';

  @override
  String get productTableError => 'حدث خطأ';

  @override
  String get productTableDuplicate => 'تكرار';

  @override
  String get productTableDelete => 'حذف';

  @override
  String get productTableProposed => 'مقترح';

  @override
  String get productTablePublishedTitle => 'منشور';

  @override
  String get productTableRejected => 'مرفوض';

  @override
  String get productTableDraftTitle => 'مسودة';

  @override
  String get productTableName => 'الاسم';

  @override
  String get productTableCollection => 'المجموعة';

  @override
  String get productTableStatus => 'الحالة';

  @override
  String get productTableAvailability => 'التوفر';

  @override
  String get productTableInventory => 'المخزون';

  @override
  String productTableInventoryInStockCountOne(String count) {
    return ' متوفر لـ $count متغير';
  }

  @override
  String productTableInventoryInStockCountOther(String count) {
    return ' متوفر لـ $count متغير';
  }

  @override
  String get reservationFormLocation => 'الموقع';

  @override
  String get reservationFormChooseWhereYouWishToReserveFrom =>
      'اختر المكان الذي تريد حجز منه.';

  @override
  String get reservationFormItemToReserve => 'العنصر للحجز';

  @override
  String get reservationFormSelectTheItemThatYouWishToReserve =>
      'حدد العنصر الذي تريد حجزه.';

  @override
  String get reservationFormItem => 'العنصر';

  @override
  String get reservationFormInStock => 'متوفر';

  @override
  String get reservationFormAvailable => 'متاح';

  @override
  String get reservationFormReserve => 'احجز';

  @override
  String get reservationFormRemoveItem => 'إزالة العنصر';

  @override
  String get reservationFormDescription => 'الوصف';

  @override
  String get reservationFormWhatTypeOfReservationIsThis => 'ما نوع الحجز هذا؟';

  @override
  String get reservationsTableReservations => 'الحجوزات';

  @override
  String get reservationsTableEdit => 'تعديل';

  @override
  String get reservationsTableDelete => 'حذف';

  @override
  String get reservationsTableConfirmDelete =>
      'هل أنت متأكد من إزالة هذا الحجز؟';

  @override
  String get reservationsTableRemoveReservation => 'إزالة الحجز';

  @override
  String get reservationsTableReservationHasBeenRemoved => 'تمت إزالة الحجز';

  @override
  String get newSuccess => 'نجاح';

  @override
  String get newSuccessfullyCreatedReservation => 'تم إنشاء الحجز بنجاح';

  @override
  String get newError => 'حدث خطأ';

  @override
  String get newCancel => 'إلغاء';

  @override
  String get newSaveReservation => 'حفظ الحجز';

  @override
  String get newReserveItem => 'حجز عنصر';

  @override
  String get newMetadata => 'البيانات الوصفية';

  @override
  String get reservationsTableOrderId => 'معرّف الطلب';

  @override
  String get reservationsTableDescription => 'الوصف';

  @override
  String get reservationsTableCreated => 'تم إنشاؤه';

  @override
  String get reservationsTableQuantity => 'الكمية';

  @override
  String get searchModalStartTypingToSearch => 'ابدأ الكتابة للبحث...';

  @override
  String get searchModalClearSearch => 'مسح البحث';

  @override
  String get searchModalOr => 'أو';

  @override
  String get searchModalToNavigate => 'للتنقل';

  @override
  String get searchModalToSelectAnd => 'للتحديد، و';

  @override
  String get searchModalToSearchAnytime => 'للبحث في أي وقت';

  @override
  String get templatesSettings => 'الإعدادات';

  @override
  String get templatesManageTheSettingsForYourMedusaStore =>
      'إدارة إعدادات متجر Medusa الخاص بك';

  @override
  String get transferOrdersModalInfo => 'معلومات';

  @override
  String get transferOrdersModalCustomerIsAlreadyTheOwnerOfTheOrder =>
      'العميل هو بالفعل مالك الطلب';

  @override
  String get transferOrdersModalSuccess => 'نجاح';

  @override
  String
      get transferOrdersModalSuccessfullyTransferredOrderToDifferentCustomer =>
          'تم تحويل الطلب بنجاح إلى عميل مختلف';

  @override
  String get transferOrdersModalError => 'حدث خطأ';

  @override
  String get transferOrdersModalCouldNotTransferOrderToDifferentCustomer =>
      'تعذر تحويل الطلب إلى عميل مختلف';

  @override
  String get transferOrdersModalTransferOrder => 'تحويل الطلب';

  @override
  String get transferOrdersModalOrder => 'الطلب';

  @override
  String get transferOrdersModalCurrentOwner => 'المالك الحالي';

  @override
  String get transferOrdersModalTheCustomerCurrentlyRelatedToThisOrder =>
      'العميل المرتبط حاليًا بهذا الطلب';

  @override
  String get transferOrdersModalNewOwner => 'مالك جديد';

  @override
  String get transferOrdersModalTheCustomerToTransferThisOrderTo =>
      'العميل الذي يتم تحويل هذا الطلب إليه';

  @override
  String get transferOrdersModalCancel => 'إلغاء';

  @override
  String get transferOrdersModalConfirm => 'تأكيد';

  @override
  String get templatesEditUser => 'تعديل المستخدم';

  @override
  String get templatesRemoveUser => 'إزالة المستخدم';

  @override
  String get templatesResendInvitation => 'إعادة إرسال الدعوة';

  @override
  String get templatesSuccess => 'نجاح';

  @override
  String get templatesInvitiationLinkHasBeenResent =>
      'تمت إعادة إرسال رابط الدعوة';

  @override
  String get templatesCopyInviteLink => 'نسخ رابط الدعوة';

  @override
  String get templatesInviteLinkCopiedToClipboard =>
      'تم نسخ رابط الدعوة إلى الحافظة';

  @override
  String get templatesRemoveInvitation => 'إزالة الدعوة';

  @override
  String get templatesExpired => 'منتهية';

  @override
  String get templatesPending => 'قيد الانتظار';

  @override
  String get templatesAll => 'الكل';

  @override
  String get templatesMember => 'عضو';

  @override
  String get templatesAdmin => 'مدير';

  @override
  String get templatesNoTeamPermissions => 'لا توجد أذونات فريق';

  @override
  String get templatesStatus => 'الحالة';

  @override
  String get templatesActive => 'نشط';

  @override
  String get templatesName => 'الاسم';

  @override
  String get templatesEmail => 'البريد الإلكتروني';

  @override
  String get templatesTeamPermissions => 'أذونات الفريق';

  @override
  String get templatesConfirmRemove => 'هل أنت متأكد من إزالة هذا المستخدم؟';

  @override
  String get templatesRemoveUserHeading => 'إزالة المستخدم';

  @override
  String get templatesUserHasBeenRemoved => 'تمت إزالة المستخدم';

  @override
  String get templatesConfirmRemoveInvite =>
      'هل أنت متأكد من إزالة هذه الدعوة؟';

  @override
  String get templatesRemoveInvite => 'إزالة الدعوة';

  @override
  String get templatesInvitiationHasBeenRemoved => 'تمت إزالة الدعوة';

  @override
  String get multiselectChooseCategories => 'اختر الفئات';

  @override
  String domainCategoriesMultiselectSelectedWithCountsOne(String count) {
    return '$count';
  }

  @override
  String domainCategoriesMultiselectSelectedWithCountsOther(String count) {
    return '$count';
  }

  @override
  String get detailsSuccess => 'نجاح';

  @override
  String get detailsUpdatedProductsInCollection =>
      'تم تحديث المنتجات في المجموعة';

  @override
  String get detailsError => 'حدث خطأ';

  @override
  String get detailsBackToCollections => 'العودة إلى المجموعات';

  @override
  String get detailsEditCollection => 'تعديل المجموعة';

  @override
  String get detailsDelete => 'حذف';

  @override
  String get detailsMetadata => 'البيانات الوصفية';

  @override
  String get detailsEditProducts => 'تعديل المنتجات';

  @override
  String get detailsProductsInThisCollection => 'المنتجات في هذه المجموعة';

  @override
  String get detailsRawCollection => 'المجموعة الأصلية';

  @override
  String get detailsDeleteCollection => 'حذف المجموعة';

  @override
  String get detailsSuccessfullyDeletedCollection => 'تم حذف المجموعة بنجاح';

  @override
  String get detailsYesDelete => 'نعم، احذف';

  @override
  String get detailsSuccessfullyUpdatedCustomer => 'تم تحديث العميل بنجاح';

  @override
  String get detailsCustomerDetails => 'تفاصيل العميل';

  @override
  String get detailsGeneral => 'عام';

  @override
  String get detailsFirstName => 'الاسم الأول';

  @override
  String get detailsLebron => 'ليبرون';

  @override
  String get detailsLastName => 'اسم العائلة';

  @override
  String get detailsJames => 'جيمس';

  @override
  String get detailsEmail => 'البريد الإلكتروني';

  @override
  String get detailsPhoneNumber => 'رقم الهاتف';

  @override
  String get detailsCancel => 'إلغاء';

  @override
  String get detailsSaveAndClose => 'حفظ وإغلاق';

  @override
  String get detailsEdit => 'تعديل';

  @override
  String get detailsBackToCustomers => 'العودة إلى العملاء';

  @override
  String get detailsFirstSeen => 'شوهد لأول مرة';

  @override
  String get detailsPhone => 'هاتف';

  @override
  String get detailsOrders => 'الطلبات';

  @override
  String get detailsUser => 'المستخدم';

  @override
  String detailsOrdersOne(String count) {
    return 'الطلبات $count';
  }

  @override
  String detailsOrdersOther(String count) {
    return 'الطلبات $count';
  }

  @override
  String get detailsAnOverviewOfCustomerOrders => 'نظرة عامة على طلبات العميل';

  @override
  String get detailsRawCustomer => 'العميل الأصلي';

  @override
  String get groupsGroupUpdated => 'تم تحديث المجموعة';

  @override
  String get groupsGroupCreated => 'تم إنشاء المجموعة';

  @override
  String get groupsTheCustomerGroupHasBeenUpdated => 'تم تحديث مجموعة العملاء';

  @override
  String get groupsTheCustomerGroupHasBeenCreated => 'تم إنشاء مجموعة العملاء';

  @override
  String get groupsEditCustomerGroup => 'تعديل مجموعة العملاء';

  @override
  String get groupsCreateANewCustomerGroup => 'إنشاء مجموعة عملاء جديدة';

  @override
  String get groupsDetails => 'التفاصيل';

  @override
  String get groupsMetadata => 'البيانات الوصفية';

  @override
  String get groupsCancel => 'إلغاء';

  @override
  String get groupsEditGroup => 'تعديل المجموعة';

  @override
  String get groupsPublishGroup => 'نشر المجموعة';

  @override
  String get groupsNoCustomersInThisGroupYet =>
      'لا يوجد عملاء في هذه المجموعة بعد';

  @override
  String get groupsCustomers => 'العملاء';

  @override
  String get groupsEdit => 'تعديل';

  @override
  String get groupsDelete => 'حذف';

  @override
  String get groupsYesDelete => 'نعم، احذف';

  @override
  String get groupsDeleteTheGroup => 'حذف المجموعة';

  @override
  String get groupsGroupDeleted => 'تم حذف المجموعة';

  @override
  String get groupsConfirmDeleteCustomerGroup =>
      'هل أنت متأكد من حذف مجموعة العملاء هذه؟';

  @override
  String get groupsBackToCustomerGroups => 'العودة إلى مجموعات العملاء';

  @override
  String get groupsNewGroup => 'مجموعة جديدة';

  @override
  String get addConditionConditionsWereSuccessfullyAdded =>
      'تمت إضافة الشروط بنجاح';

  @override
  String get addConditionPromotionConditionsUpdated =>
      'تم تحديث شروط العرض الترويجي';

  @override
  String get addConditionUseConditionsMustBeUsedWithinAConditionsProvider =>
      'يجب استخدام useConditions داخل ConditionsProvider';

  @override
  String get collectionsSearch => 'بحث...';

  @override
  String get collectionsCancel => 'إلغاء';

  @override
  String get collectionsSaveAndGoBack => 'حفظ والعودة';

  @override
  String get collectionsSaveAndClose => 'حفظ وإغلاق';

  @override
  String get customerGroupsSearch => 'بحث...';

  @override
  String get customerGroupsCancel => 'إلغاء';

  @override
  String get customerGroupsSaveAndGoBack => 'حفظ والعودة';

  @override
  String get customerGroupsSaveAndClose => 'حفظ وإغلاق';

  @override
  String get productTypesSearch => 'بحث...';

  @override
  String get productTypesCancel => 'إلغاء';

  @override
  String get productTypesSaveAndGoBack => 'حفظ والعودة';

  @override
  String get productTypesSaveAndClose => 'حفظ وإغلاق';

  @override
  String get productsSearch => 'بحث...';

  @override
  String get productsCancel => 'إلغاء';

  @override
  String get productsSaveAndGoBack => 'حفظ والعودة';

  @override
  String get productsSaveAndClose => 'حفظ وإغلاق';

  @override
  String get tagsSearch => 'بحث...';

  @override
  String get tagsCancel => 'إلغاء';

  @override
  String get tagsSaveAndGoBack => 'حفظ والعودة';

  @override
  String get tagsSaveAndClose => 'حفظ وإغلاق';

  @override
  String get editConditionAddConditions => 'إضافة شروط';

  @override
  String editConditionSelectedWithCountOne(String count) {
    return '$count';
  }

  @override
  String editConditionSelectedWithCountOther(String count) {
    return '$count';
  }

  @override
  String get editConditionDeselect => 'إلغاء التحديد';

  @override
  String get editConditionRemove => 'إزالة';

  @override
  String get editConditionAdd => 'إضافة';

  @override
  String editConditionTitle(String type) {
    return 'تحرير $type في شرط الترويج';
  }

  @override
  String get editConditionClose => 'إغلاق';

  @override
  String get editConditionSuccess => 'نجاح';

  @override
  String get editConditionTheResourcesWereSuccessfullyAdded =>
      'تمت إضافة الموارد بنجاح';

  @override
  String get editConditionError => 'حدث خطأ';

  @override
  String get editConditionFailedToAddResources => 'فشلت إضافة الموارد';

  @override
  String get editConditionTheResourcesWereSuccessfullyRemoved =>
      'تمت إزالة الموارد بنجاح';

  @override
  String get editConditionFailedToRemoveResources => 'فشلت إزالة الموارد';

  @override
  String
      get editConditionUseEditConditionContextMustBeUsedWithinAnEditConditionProvider =>
          'يجب استخدام useEditConditionContext داخل EditConditionProvider';

  @override
  String get conditionsConditions => 'الشروط';

  @override
  String get conditionsAddConditionLabel => 'إضافة شرط';

  @override
  String get conditionsThisPromotionHasNoConditions =>
      'لا توجد شروط لهذا العرض الترويجي';

  @override
  String get conditionsSuccess => 'نجاح';

  @override
  String get conditionsConditionRemoved => 'تمت إزالة الشرط';

  @override
  String get conditionsError => 'حدث خطأ';

  @override
  String get conditionsEditCondition => 'تعديل الشرط';

  @override
  String get conditionsDeleteCondition => 'حذف الشرط';

  @override
  String get conditionsPromotionIsApplicableToSpecificProducts =>
      'ينطبق العرض الترويجي على منتجات محددة';

  @override
  String get conditionsPromotionIsApplicableToSpecificCollections =>
      'ينطبق العرض الترويجي على مجموعات محددة';

  @override
  String get conditionsPromotionIsApplicableToSpecificProductTags =>
      'ينطبق العرض الترويجي على علامات منتج محددة';

  @override
  String get conditionsPromotionIsApplicableToSpecificProductTypes =>
      'ينطبق العرض الترويجي على أنواع منتجات محددة';

  @override
  String get conditionsPromotionIsApplicableToSpecificCustomerGroups =>
      'ينطبق العرض الترويجي على مجموعات عملاء محددة';

  @override
  String get configurationsSuccess => 'نجاح';

  @override
  String get configurationsPromotionUpdatedSuccessfully =>
      'تم تحديث العرض الترويجي بنجاح';

  @override
  String get configurationsError => 'حدث خطأ';

  @override
  String get configurationsEditConfigurations => 'تحرير التكوينات';

  @override
  String get configurationsCancel => 'إلغاء';

  @override
  String get configurationsSave => 'حفظ';

  @override
  String get configurationsConfigurations => 'التكوينات';

  @override
  String get configurationsStartDate => 'تاريخ البدء';

  @override
  String get configurationsEndDate => 'تاريخ الانتهاء';

  @override
  String get configurationsDeleteConfiguration => 'حذف التكوين';

  @override
  String get configurationsPromotionEndDateRemoved =>
      'تمت إزالة تاريخ انتهاء العرض الترويجي';

  @override
  String get configurationsNumberOfRedemptions => 'عدد مرات الاسترداد';

  @override
  String get configurationsRedemptionLimitRemoved => 'تمت إزالة حد الاسترداد';

  @override
  String get configurationsDeleteSetting => 'حذف الإعداد';

  @override
  String get configurationsPromotionDurationRemoved =>
      'تمت إزالة مدة العرض الترويجي';

  @override
  String get generalSuccess => 'نجاح';

  @override
  String get generalPromotionUpdatedSuccessfully =>
      'تم تحديث العرض الترويجي بنجاح';

  @override
  String get generalError => 'حدث خطأ';

  @override
  String get generalEditGeneralInformation => 'تعديل المعلومات العامة';

  @override
  String get generalDetails => 'التفاصيل';

  @override
  String get generalMetadata => 'البيانات الوصفية';

  @override
  String get generalCancel => 'إلغاء';

  @override
  String get generalSaveAndClose => 'حفظ وإغلاق';

  @override
  String get generalDeletePromotion => 'حذف الترويج';

  @override
  String get generalConfirmDeletePromotion =>
      'هل أنت متأكد من حذف هذا الترويج؟';

  @override
  String get generalPromotionDeletedSuccessfully => 'تم حذف الترويج بنجاح';

  @override
  String get generalPromotionPublishedSuccessfully =>
      'تم نشر العرض الترويجي بنجاح';

  @override
  String get generalPromotionDraftedSuccessfully =>
      'Promotion drafted successfully';

  @override
  String get generalTemplatePromotion => 'Template promotion';

  @override
  String get generalPublished => 'منشور';

  @override
  String get generalDraft => 'مسودة';

  @override
  String get generalPromotionAmount => 'Promotion Amount';

  @override
  String get generalValidRegions => 'المناطق الصالحة';

  @override
  String get generalTotalRedemptions => 'إجمالي الاستردادات';

  @override
  String get generalFreeShipping => 'الشحن مجاني';

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
  String get addConditionTablesCancel => 'إلغاء';

  @override
  String get addConditionTablesSaveAndAddMore => 'حفظ وإضافة المزيد';

  @override
  String get addConditionTablesSaveAndClose => 'حفظ وإغلاق';

  @override
  String get addConditionTablesSearchByTitle => 'البحث حسب العنوان...';

  @override
  String get addConditionTablesSearchGroups => 'بحث المجموعات...';

  @override
  String get addConditionTablesSearchProducts => 'بحث المنتجات...';

  @override
  String get addConditionTablesSearchByTag => 'البحث حسب العلامة...';

  @override
  String get addConditionTablesSearchByType => 'البحث حسب النوع...';

  @override
  String get detailsConditionTablesSearchByTitle => 'البحث حسب العنوان...';

  @override
  String get detailsConditionTablesSearchGroups => 'بحث المجموعات...';

  @override
  String get detailsConditionTablesCancel => 'إلغاء';

  @override
  String get detailsConditionTablesSaveAndAddMore => 'حفظ وإضافة المزيد';

  @override
  String get detailsConditionTablesSaveAndClose => 'حفظ وإغلاق';

  @override
  String get detailsConditionTablesSearchProducts => 'بحث المنتجات...';

  @override
  String get detailsConditionTablesSearchByTag => 'البحث حسب العلامة...';

  @override
  String get detailsConditionTablesSearchByType => 'البحث حسب النوع...';

  @override
  String get editConditionTablesSearchByTitle => 'البحث حسب العنوان...';

  @override
  String get editConditionTablesTitle => 'العنوان';

  @override
  String get editConditionTablesSearchGroups => 'بحث المجموعات...';

  @override
  String get editConditionTablesCancel => 'إلغاء';

  @override
  String get editConditionTablesDeleteCondition => 'حذف الشرط';

  @override
  String get editConditionTablesSave => 'حفظ';

  @override
  String get editConditionTablesSearchProducts => 'بحث المنتجات...';

  @override
  String get editConditionTablesSearchByTag => 'البحث حسب العلامة...';

  @override
  String get editConditionTablesSearchByType => 'البحث حسب النوع...';

  @override
  String get sharedTitle => 'العنوان';

  @override
  String get sharedProducts => 'المنتجات';

  @override
  String get sharedAppliesToTheSelectedItems => 'ينطبق على العناصر المحددة.';

  @override
  String get sharedAppliesToAllItemsExceptTheSelectedItems =>
      'ينطبق على جميع العناصر باستثناء العناصر المحددة.';

  @override
  String get sharedMembers => 'الأعضاء';

  @override
  String get sharedStatus => 'الحالة';

  @override
  String get sharedVariants => 'المتغيرات';

  @override
  String get sharedTag => 'العلامة';

  @override
  String get sharedType => 'النوع';

  @override
  String editConditionsModalTitle(String title) {
    return 'تعديل $title';
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
    return '+$remainder أكثر';
  }

  @override
  String get conditionsEdit => 'تحرير';

  @override
  String get conditionsProduct => 'المنتج';

  @override
  String get conditionsCollection => 'المجموعة';

  @override
  String get conditionsTag => 'العلامة';

  @override
  String get conditionsCustomerGroup => 'مجموعة العملاء';

  @override
  String get conditionsType => 'النوع';

  @override
  String get conditionsAddCondition => 'إضافة شرط';

  @override
  String get sectionsStartDate => 'تاريخ البدء';

  @override
  String get sectionsScheduleThePromotionToActivateInTheFuture =>
      'Schedule the promotion to activate in the future.';

  @override
  String get sectionsSelectPromotionStartDate =>
      'If you want to schedule the promotion to activate in the future, you can set a start date here, otherwise the promotion will be active immediately.';

  @override
  String get sectionsStartTime => 'وقت البدء';

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
  String get sectionsExpiryDate => 'تاريخ الانتهاء';

  @override
  String get sectionsExpiryTime => 'وقت الانتهاء';

  @override
  String get sectionsLimitTheNumberOfRedemptions => 'تحديد عدد مرات الاسترداد؟';

  @override
  String get sectionsLimitAppliesAcrossAllCustomersNotPerCustomer =>
      'ينطبق الحد على جميع العملاء، وليس لكل عميل.';

  @override
  String get sectionsLimitPromotionNumberOfUses =>
      'If you wish to limit the amount of times a customer can redeem this promotion, you can set a limit here.';

  @override
  String get sectionsNumberOfRedemptions => 'عدد مرات الاسترداد';

  @override
  String get sectionsAvailabilityDuration => 'مدة التوفر؟';

  @override
  String get sectionsSetTheDurationOfThePromotion =>
      'Set the duration of the promotion.';

  @override
  String get sectionsSelectAPromotionType => 'Select a promotion type';

  @override
  String get sectionsTotalAmount => 'المبلغ الإجمالي';

  @override
  String get sectionsApplyToTheTotalAmount => 'تطبيق على المبلغ الإجمالي';

  @override
  String get sectionsItemSpecific => 'خاص بالعنصر';

  @override
  String get sectionsApplyToEveryAllowedItem => 'التطبيق على كل عنصر مسموح به';

  @override
  String get sectionsPercentage => 'النسبة المئوية';

  @override
  String get sectionsFixedAmount => 'مبلغ ثابت';

  @override
  String get sectionsPromotionInWholeNumbers => 'Promotion in whole numbers';

  @override
  String get sectionsYouCanOnlySelectOneValidRegionIfYouWantToUseTheFixedAmountType =>
      'يمكنك تحديد منطقة صالحة واحدة فقط إذا كنت تريد استخدام النوع ذو المبلغ الثابت';

  @override
  String get sectionsFreeShipping => 'شحن مجاني';

  @override
  String get sectionsOverrideDeliveryAmount => 'تجاوز مبلغ التسليم';

  @override
  String get sectionsAtLeastOneRegionIsRequired =>
      'منطقة واحدة على الأقل مطلوبة';

  @override
  String get sectionsChooseValidRegions => 'اختر المناطق الصالحة';

  @override
  String get sectionsCode => 'الرمز';

  @override
  String get sectionsSummersale10 => 'صيف10';

  @override
  String get sectionsCodeIsRequired => 'الرمز مطلوب';

  @override
  String get sectionsAmountIsRequired => 'المبلغ مطلوب';

  @override
  String get sectionsAmount => 'المبلغ';

  @override
  String get sectionsCustomerInvoiceCode =>
      'الرمز الذي سيدخله عملائك أثناء الدفع. سيظهر هذا على فاتورة عميلك.';

  @override
  String get sectionsUppercaseLettersAndNumbersOnly => 'أحرف كبيرة وأرقام فقط.';

  @override
  String get sectionsDescription => 'الوصف';

  @override
  String get sectionsSummerSale2022 => 'تخفيضات الصيف 2022';

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
  String get utilsProducts => 'المنتجات';

  @override
  String get utilsGroups => 'المجموعات';

  @override
  String get utilsTags => 'العلامات';

  @override
  String get utilsCollections => 'المجموعات';

  @override
  String get utilsTypes => 'الأنواع';

  @override
  String get giftCardsCreatedGiftCard => 'تم إنشاء بطاقة الهدايا';

  @override
  String get giftCardsCustomGiftCardWasCreatedSuccessfully =>
      'تم إنشاء بطاقة الهدايا المخصصة بنجاح';

  @override
  String get giftCardsError => 'حدث خطأ';

  @override
  String get giftCardsCustomGiftCard => 'بطاقة هدايا مخصصة';

  @override
  String get giftCardsDetails => 'التفاصيل';

  @override
  String get giftCardsReceiver => 'المستلم';

  @override
  String get giftCardsCancel => 'إلغاء';

  @override
  String get giftCardsCreateAndSend => 'إنشاء وإرسال';

  @override
  String get detailsUpdatedGiftCard => 'تم تحديث بطاقة الهدايا';

  @override
  String get detailsGiftCardWasSuccessfullyUpdated =>
      'تم تحديث بطاقة الهدايا بنجاح';

  @override
  String get detailsFailedToUpdateGiftCard => 'فشل تحديث بطاقة الهدايا';

  @override
  String get detailsEditGiftCard => 'تحرير بطاقة الهدايا';

  @override
  String get detailsDetails => 'التفاصيل';

  @override
  String get detailsEditDetails => 'تحرير التفاصيل';

  @override
  String get detailsUpdateBalanceLabel => 'تحديث الرصيد';

  @override
  String get detailsUpdatedStatus => 'تم تحديث الحالة';

  @override
  String get detailsSuccessfullyUpdatedTheStatusOfTheGiftCard =>
      'تم تحديث حالة بطاقة الهدايا بنجاح';

  @override
  String get detailsBackToGiftCards => 'العودة إلى بطاقات الهدايا';

  @override
  String get detailsOriginalAmount => 'المبلغ الأصلي';

  @override
  String get detailsBalance => 'الرصيد';

  @override
  String get detailsRegion => 'المنطقة';

  @override
  String get detailsExpiresOn => 'تنتهي صلاحيتها في';

  @override
  String get detailsCreated => 'تم إنشاؤه';

  @override
  String get detailsRawGiftCard => 'بطاقة الهدايا الأصلية';

  @override
  String get detailsBalanceUpdated => 'تم تحديث الرصيد';

  @override
  String get detailsGiftCardBalanceWasUpdated => 'تم تحديث رصيد بطاقة الهدايا';

  @override
  String get detailsFailedToUpdateBalance => 'فشل تحديث الرصيد';

  @override
  String get detailsUpdateBalance => 'تحديث الرصيد';

  @override
  String get manageBackToGiftCards => 'العودة إلى بطاقات الهدايا';

  @override
  String get giftCardsPleaseEnterANameForTheGiftCard =>
      'الرجاء إدخال اسم لبطاقة الهدايا';

  @override
  String get giftCardsPleaseAddAtLeastOneDenomination =>
      'الرجاء إضافة فئة واحدة على الأقل';

  @override
  String get giftCardsDenominations => 'الفئات';

  @override
  String get giftCardsSuccess => 'نجاح';

  @override
  String get giftCardsSuccessfullyCreatedGiftCard =>
      'تم إنشاء بطاقة الهدايا بنجاح';

  @override
  String get giftCardsCreateGiftCard => 'إنشاء بطاقة هدايا';

  @override
  String get giftCardsGiftCardDetails => 'تفاصيل بطاقة الهدايا';

  @override
  String get giftCardsName => 'الاسم';

  @override
  String get giftCardsTheBestGiftCard => 'أفضل بطاقة هدايا';

  @override
  String get giftCardsDescription => 'الوصف';

  @override
  String get giftCardsTheBestGiftCardOfAllTime =>
      'أفضل بطاقة هدايا على الإطلاق';

  @override
  String get giftCardsThumbnail => 'الصورة المصغرة';

  @override
  String get giftCardsDelete => 'حذف';

  @override
  String get giftCardsSizeRecommended =>
      'ينصح بـ 1200 x 1600 (3:4)، ما يصل إلى 10 ميغابايت لكل صورة';

  @override
  String get giftCardsAmount => 'المبلغ';

  @override
  String get giftCardsAddDenomination => 'إضافة فئة';

  @override
  String get giftCardsCreatePublish => 'إنشاء ونشر';

  @override
  String get giftCardsSuccessfullyUpdatedGiftCard =>
      'تم تحديث بطاقة الهدايا بنجاح';

  @override
  String get giftCardsGiftCards => 'بطاقات الهدايا';

  @override
  String get giftCardsManage => 'إدارة بطاقات الهدايا لمتجرك Medusa';

  @override
  String get giftCardsAreYouReadyToSellYourFirstGiftCard =>
      'هل أنت مستعد لبيع أول بطاقة هدايا؟';

  @override
  String get giftCardsNoGiftCardHasBeenAddedYet =>
      'لم يتم إضافة بطاقات هدايا بعد.';

  @override
  String get giftCardsHistory => 'السجل';

  @override
  String get giftCardsSeeTheHistoryOfPurchasedGiftCards =>
      'اعرض سجل بطاقات الهدايا المشتراة';

  @override
  String get giftCardsSuccessfullyDeletedGiftCard =>
      'تم حذف بطاقة الهدايا بنجاح';

  @override
  String get giftCardsYesDelete => 'نعم، احذف';

  @override
  String get giftCardsDeleteGiftCard => 'حذف بطاقة الهدايا';

  @override
  String get inventoryFilters => 'الفلاتر';

  @override
  String get addressFormAddress => 'العنوان';

  @override
  String get addressFormCompany => 'الشركة';

  @override
  String get addressFormAddress1 => 'العنوان 1';

  @override
  String get addressFormThisFieldIsRequired => 'هذا الحقل مطلوب';

  @override
  String get addressFormAddress2 => 'العنوان 2';

  @override
  String get addressFormPostalCode => 'الرمز البريدي';

  @override
  String get addressFormCity => 'المدينة';

  @override
  String get addressFormCountry => 'البلد';

  @override
  String get editSalesChannelsEditChannels => 'تحرير القنوات';

  @override
  String get editSalesChannelsAddChannels => 'إضافة قنوات';

  @override
  String get generalFormLocationName => 'اسم الموقع';

  @override
  String get generalFormFlagshipStoreWarehouse => 'المتجر الرئيسي، المستودع';

  @override
  String get generalFormNameIsRequired => 'الاسم مطلوب';

  @override
  String get locationCardDeleteLocation => 'حذف الموقع';

  @override
  String get locationCardConfirmDelete =>
      'هل أنت متأكد من حذف هذا الموقع؟ سيؤدي ذلك أيضًا إلى حذف جميع مستويات المخزون والحجوزات المرتبطة بهذا الموقع.';

  @override
  String get locationCardSuccess => 'نجاح';

  @override
  String get locationCardLocationDeletedSuccessfully => 'تم حذف الموقع بنجاح';

  @override
  String get locationCardError => 'حدث خطأ';

  @override
  String get locationCardEditDetails => 'تعديل التفاصيل';

  @override
  String get locationCardDelete => 'حذف';

  @override
  String get locationCardConnectedSalesChannels => 'قنوات المبيعات المتصلة';

  @override
  String get salesChannelsFormAddSalesChannels => 'إضافة قنوات مبيعات';

  @override
  String get salesChannelsFormEditChannels => 'تحرير القنوات';

  @override
  String get salesChannelsSectionNotConnectedToAnySalesChannelsYet =>
      'غير متصل بأي قنوات مبيعات بعد';

  @override
  String get editSuccess => 'نجاح';

  @override
  String get editLocationEditedSuccessfully => 'تم تعديل الموقع بنجاح';

  @override
  String get editError => 'حدث خطأ';

  @override
  String get editEditLocationDetails => 'تحرير تفاصيل الموقع';

  @override
  String get editMetadata => 'البيانات الوصفية';

  @override
  String get editCancel => 'إلغاء';

  @override
  String get editSaveAndClose => 'حفظ وإغلاق';

  @override
  String get newLocationAddedSuccessfully => 'تمت إضافة الموقع بنجاح';

  @override
  String get newLocationCreated =>
      'تم إنشاء الموقع بنجاح، ولكن حدث خطأ أثناء ربط قنوات المبيعات';

  @override
  String get newCancelLocationChanges =>
      'هل أنت متأكد أنك تريد الإلغاء مع وجود تغييرات غير محفوظة';

  @override
  String get newYesCancel => 'نعم، إلغاء';

  @override
  String get newNoContinueCreating => 'لا، متابعة الإنشاء';

  @override
  String get newAddLocation => 'إضافة موقع';

  @override
  String get newAddNewLocation => 'إضافة موقع جديد';

  @override
  String get newGeneralInformation => 'معلومات عامة';

  @override
  String get newLocationDetails => 'حدد تفاصيل هذا الموقع';

  @override
  String get newSelectLocationChannel =>
      'حدد قنوات المبيعات التي يمكن شراء عناصر هذا الموقع من خلالها.';

  @override
  String get oauthCompleteInstallation => 'إكمال التثبيت';

  @override
  String get claimTypeFormRefund => 'استرداد';

  @override
  String get claimTypeFormReplace => 'استبدال';

  @override
  String get itemsToReceiveFormItemsToReceive => 'العناصر للاستلام';

  @override
  String get itemsToReceiveFormProduct => 'المنتج';

  @override
  String get itemsToReceiveFormQuantity => 'الكمية';

  @override
  String get itemsToReceiveFormRefundable => 'قابلة للاسترداد';

  @override
  String get addReturnReasonReasonForReturn => 'سبب الاسترجاع';

  @override
  String get addReturnReasonReason => 'السبب';

  @override
  String get addReturnReasonChooseAReturnReason => 'اختر سبب الاسترجاع';

  @override
  String get addReturnReasonNote => 'ملاحظة';

  @override
  String get addReturnReasonProductWasDamagedDuringShipping =>
      'تضرر المنتج أثناء الشحن';

  @override
  String get addReturnReasonCancel => 'إلغاء';

  @override
  String get addReturnReasonSaveAndGoBack => 'حفظ والعودة';

  @override
  String get addReturnReasonSelectReasonTitle => 'حدد السبب';

  @override
  String get addReturnReasonEditReason => 'تعديل السبب';

  @override
  String get addReturnReasonSelectReason => 'حدد السبب';

  @override
  String get itemsToReturnFormItemsToClaim => 'العناصر للمطالبة';

  @override
  String get itemsToReturnFormItemsToReturn => 'العناصر للإرجاع';

  @override
  String get itemsToReturnFormProduct => 'المنتج';

  @override
  String get itemsToReturnFormQuantity => 'الكمية';

  @override
  String get itemsToReturnFormRefundable => 'قابلة للاسترداد';

  @override
  String get addAdditionalItemsScreenGoBack => 'العودة';

  @override
  String get addAdditionalItemsScreenAddProducts => 'إضافة منتجات';

  @override
  String get addAdditionalItemsScreenAddProductVariants => 'إضافة متغيرات منتج';

  @override
  String get addAdditionalItemsScreenSearchProducts => 'البحث عن منتجات';

  @override
  String get addAdditionalItemsScreenVariantPriceMissing =>
      'لا يحتوي هذا المتغير على سعر لمنطقة / عملة هذا الطلب ، ولا يمكن تحديده.';

  @override
  String get addAdditionalItemsScreenStock => 'المخزون';

  @override
  String get addAdditionalItemsScreenPrice => 'السعر';

  @override
  String
      get addAdditionalItemsScreenPriceOverriddenInPriceListApplicableToThisOrder =>
          'تم تجاوز السعر في قائمة الأسعار المنطبقة على هذا الطلب.';

  @override
  String get itemsToSendFormItemsToSend => 'العناصر للإرسال';

  @override
  String get itemsToSendFormAddProducts => 'إضافة منتجات';

  @override
  String get itemsToSendFormProduct => 'المنتج';

  @override
  String get itemsToSendFormQuantity => 'الكمية';

  @override
  String get itemsToSendFormPrice => 'السعر';

  @override
  String get itemsToSendFormPriceOverriddenInPriceListApplicableToThisOrder =>
      'تم تجاوز السعر في قائمة الأسعار المنطبقة على هذا الطلب.';

  @override
  String get refundAmountFormCancelEditingRefundAmount =>
      'إلغاء تحرير مبلغ الاسترداد';

  @override
  String get refundAmountFormEditRefundAmount => 'تحرير مبلغ الاسترداد';

  @override
  String get refundAmountFormRefundAmountCannotBeNegative =>
      'لا يمكن أن يكون مبلغ الاسترداد سالبًا';

  @override
  String get refundAmountFormTheRefundAmountMustBeAtLeast0 =>
      'يجب أن يكون مبلغ الاسترداد 0 على الأقل';

  @override
  String reservationIndicatorAwaitingReservationCount(
      String awaitingReservation) {
    return '$awaitingReservation عناصر غير محجوزة';
  }

  @override
  String get reservationIndicatorThisItemHasBeenFulfilled =>
      'تم تنفيذ هذا العنصر.';

  @override
  String editReservationButtonQuantityItemLocationName(String quantity) {
    return '$quantity عنصر:';
  }

  @override
  String get reservationIndicatorEditReservation => 'تعديل الحجز';

  @override
  String get rmaSummariesClaimedItems => 'العناصر المطالب بها';

  @override
  String get rmaSummariesReplacementItems => 'عناصر الاستبدال';

  @override
  String get rmaSummariesCustomerRefundDescription =>
      'سيتلقى العميل استردادًا كاملاً للعناصر المطالب بها ، حيث لن يتم ترويج تكلفة عناصر الاستبدال والشحن. بدلاً من ذلك ، يمكنك اختيار تعيين مبلغ استرداد مخصص عند استلام العناصر المرتجعة أو إنشاء مبادلة بدلاً من ذلك.';

  @override
  String get rmaSummariesRefundAmount => 'مبلغ الاسترداد';

  @override
  String
      get rmaSummariesTheCustomerWillBeRefundedOnceTheReturnedItemsAreReceived =>
          'سيتم استرداد العميل بمجرد استلام العناصر المرتجعة';

  @override
  String get rmaSummariesTheCustomerWillBeRefundedImmediately =>
      'سيتم استرداد العميل على الفور';

  @override
  String get rmaSummariesReceiving => 'استلام';

  @override
  String get rmaSummariesFree => 'مجاني';

  @override
  String get sendNotificationFormReturn => 'العودة';

  @override
  String get sendNotificationFormExchange => 'المبادلة';

  @override
  String get sendNotificationFormClaim => 'المطالبة';

  @override
  String get sendNotificationFormSendNotifications => 'إرسال إشعارات';

  @override
  String
      get sendNotificationFormIfUncheckedTheCustomerWillNotReceiveCommunication =>
          'إذا لم يتم تحديدها ، فلن يتلقى العميل أي اتصال بخصوص هذه subject.';

  @override
  String get shippingAddressFormShippingAddress => 'عنوان الشحن';

  @override
  String get shippingAddressFormShipToADifferentAddress =>
      'الشحن إلى عنوان مختلف';

  @override
  String get shippingAddressFormCancel => 'إلغاء';

  @override
  String get shippingAddressFormSaveAndGoBack => 'حفظ والعودة';

  @override
  String get shippingAddressFormShippingInformation => 'معلومات الشحن';

  @override
  String get shippingFormShippingForReturnItems => 'الشحن للعناصر المرتجعة';

  @override
  String get shippingFormShippingForReplacementItems =>
      'الشحن لعناصر الاستبدال';

  @override
  String get shippingFormShippingMethodIsRequired => 'طريقة الشحن مطلوبة';

  @override
  String get shippingFormChooseShippingMethod => 'اختر طريقة الشحن';

  @override
  String get shippingFormShippingMethod => 'طريقة الشحن';

  @override
  String get shippingFormAddCustomPrice => 'إضافة سعر مخصص';

  @override
  String
      get shippingFormReturnShippingForItemsClaimedByTheCustomerIsComplimentary =>
          'الشحن للعناصر المطالب بها من قِبل العميل مجاني.';

  @override
  String get shippingFormShippingForReplacementItemsIsComplimentary =>
      'الشحن لعناصر الاستبدال مجاني.';

  @override
  String get componentsDecreaseQuantity => 'تقليل الكمية';

  @override
  String get componentsIncreaseQuantity => 'زيادة الكمية';

  @override
  String get detailsSuccessfullyUpdatedAddress => 'تم تحديث العنوان بنجاح';

  @override
  String get detailsBillingAddress => 'عنوان الفوترة';

  @override
  String get detailsShippingAddress => 'عنوان الشحن';

  @override
  String get detailsContact => 'جهة الاتصال';

  @override
  String get detailsLocation => 'الموقع';

  @override
  String get claimAreYouSureYouWantToClose => 'هل أنت متأكد أنك تريد الإغلاق؟';

  @override
  String get claimYouHaveUnsavedChangesAreYouSureYouWantToClose =>
      'لديك تغييرات غير محفوظة ، هل أنت متأكد أنك تريد الإغلاق؟';

  @override
  String get claimPleaseSelectAReason => 'الرجاء تحديد سبب';

  @override
  String get claimAShippingMethodForReplacementItemsIsRequired =>
      'طريقة شحن لعناصر الاستبدال مطلوبة';

  @override
  String get claimSuccessfullyCreatedClaim => 'تم إنشاء المطالبة بنجاح';

  @override
  String claimCreated(String displayId, Object display_id) {
    return 'تم إنشاء مطالبة للطلب رقم #$display_id بنجاح';
  }

  @override
  String get claimErrorCreatingClaim => 'خطأ في إنشاء المطالبة';

  @override
  String get claimCreateClaim => 'إنشاء مطالبة';

  @override
  String get claimLocation => 'الموقع';

  @override
  String get claimChooseWhichLocationYouWantToReturnTheItemsTo =>
      'اختر الموقع الذي تريد إعادة العناصر إليه.';

  @override
  String get claimSelectLocationToReturnTo => 'حدد الموقع للإرجاع إليه';

  @override
  String get claimCancel => 'إلغاء';

  @override
  String get claimSubmitAndClose => 'إرسال وإغلاق';

  @override
  String get createFulfillmentError => 'حدث خطأ';

  @override
  String get createFulfillmentPleaseSelectALocationToFulfillFrom =>
      'الرجاء تحديد موقع للتنفيذ منه';

  @override
  String get createFulfillmentCantAllowThisAction =>
      'لا يمكن السماح بهذا الإجراء';

  @override
  String get createFulfillmentTryingToFulfillMoreThanInStock =>
      'محاولة تنفيذ أكثر مما هو متوفر في المخزون';

  @override
  String get createFulfillmentSuccessfullyFulfilledOrder =>
      'تم تنفيذ الطلب بنجاح';

  @override
  String get createFulfillmentSuccessfullyFulfilledSwap =>
      'تم تنفيذ المبادلة بنجاح';

  @override
  String get createFulfillmentSuccessfullyFulfilledClaim =>
      'تم تنفيذ المطالبة بنجاح';

  @override
  String get createFulfillmentSuccess => 'نجاح';

  @override
  String get createFulfillmentCancel => 'إلغاء';

  @override
  String get createFulfillmentCreateFulfillment => 'إنشاء تنفيذ';

  @override
  String get createFulfillmentCreateFulfillmentTitle => 'إنشاء تنفيذ';

  @override
  String get createFulfillmentLocations => 'الأماكن';

  @override
  String get createFulfillmentChooseWhereYouWishToFulfillFrom =>
      'اختر المكان الذي ترغب في التنفيذ منه.';

  @override
  String get createFulfillmentItemsToFulfill => 'العناصر للتنفيذ';

  @override
  String get createFulfillmentSelectTheNumberOfItemsThatYouWishToFulfill =>
      'حدد عدد العناصر التي ترغب في تنفيذها.';

  @override
  String get createFulfillmentSendNotifications => 'إرسال إشعارات';

  @override
  String get createFulfillmentWhenToggledNotificationEmailsWillBeSent =>
      'عند التبديل، سيتم إرسال رسائل البريد الإلكتروني الإشعارية.';

  @override
  String get createFulfillmentQuantityIsNotValid => 'الكمية غير صالحة';

  @override
  String get detailCardsAllocated => 'مخصص';

  @override
  String get detailCardsNotFullyAllocated => 'غير مخصص بالكامل';

  @override
  String get detailCardsSubtotal => 'المجموع الفرعي';

  @override
  String get detailCardsShipping => 'الشحن';

  @override
  String get detailCardsTax => 'الضريبة';

  @override
  String get detailCardsTotal => 'المجموع';

  @override
  String get detailCardsEditOrder => 'تعديل الطلب';

  @override
  String get detailCardsAllocate => 'تخصيص';

  @override
  String get detailCardsPromotion => 'Promotion:';

  @override
  String get detailCardsOriginalTotal => 'المجموع الأصلي';

  @override
  String get detailsSuccessfullyUpdatedTheEmailAddress =>
      'تم تحديث عنوان البريد الإلكتروني بنجاح';

  @override
  String get detailsEmailAddress => 'عنوان البريد الإلكتروني';

  @override
  String get detailsSave => 'حفظ';

  @override
  String get detailsOrderIdCopied => 'تم نسخ معرف الطلب';

  @override
  String get detailsEmailCopied => 'تم نسخ البريد الإلكتروني';

  @override
  String get detailsCancelOrderHeading => 'إلغاء الطلب';

  @override
  String get detailsAreYouSureYouWantToCancelTheOrder =>
      'هل أنت متأكد أنك تريد إلغاء الطلب؟';

  @override
  String orderDetailsDisplayId(String displayId, Object display_id) {
    return 'الطلب رقم #$display_id';
  }

  @override
  String get detailsSuccessfullyCanceledOrder => 'تم إلغاء الطلب بنجاح';

  @override
  String get detailsGoToCustomer => 'الذهاب إلى العميل';

  @override
  String get detailsTransferOwnership => 'تحويل الملكية';

  @override
  String get detailsEditShippingAddress => 'تعديل عنوان الشحن';

  @override
  String get detailsEditBillingAddress => 'تعديل عنوان الفوترة';

  @override
  String get detailsEditEmailAddress => 'تعديل عنوان البريد الإلكتروني';

  @override
  String get detailsBackToOrders => 'العودة إلى الطلبات';

  @override
  String get detailsCancelOrder => 'إلغاء الطلب';

  @override
  String get detailsPayment => 'الدفع';

  @override
  String get detailsRefunded => 'تم استردادها';

  @override
  String get detailsTotalPaid => 'المجموع المدفوع';

  @override
  String get detailsFulfillment => 'التنفيذ';

  @override
  String get detailsCreateFulfillment => 'إنشاء تنفيذ';

  @override
  String get detailsShippingMethod => 'طريقة الشحن';

  @override
  String get detailsCustomer => 'العميل';

  @override
  String get detailsShipping => 'الشحن';

  @override
  String get detailsBilling => 'الفوترة';

  @override
  String get detailsRawOrder => 'الطلب الأصلي';

  @override
  String get markShippedSuccessfullyMarkedOrderAsShipped =>
      'تم وضع علامة الطلب على أنه تم شحنه بنجاح';

  @override
  String get markShippedSuccessfullyMarkedSwapAsShipped =>
      'تم وضع علامة المبادلة على أنه تم شحنها بنجاح';

  @override
  String get markShippedSuccessfullyMarkedClaimAsShipped =>
      'تم وضع علامة المطالبة على أنه تم شحنها بنجاح';

  @override
  String get markShippedSuccess => 'نجاح';

  @override
  String get markShippedError => 'حدث خطأ';

  @override
  String get markShippedMarkFulfillmentShipped =>
      'وضع علامة التنفيذ على أنه تم شحنه';

  @override
  String get markShippedTracking => 'التتبع';

  @override
  String get markShippedTrackingNumberLabel => 'رقم التتبع';

  @override
  String get markShippedTrackingNumber => 'رقم التتبع...';

  @override
  String get markShippedAddAdditionalTrackingNumber => '+ إضافة رقم تتبع إضافي';

  @override
  String get markShippedSendNotifications => 'إرسال إشعارات';

  @override
  String get markShippedCancel => 'إلغاء';

  @override
  String get markShippedComplete => 'اكتمال';

  @override
  String get orderLineWarning => 'تحذير';

  @override
  String get orderLineCannotDuplicateAnItemWithoutAVariant =>
      'لا يمكن تكرار عنصر بدون متغير';

  @override
  String get orderLineError => 'حدث خطأ';

  @override
  String get orderLineFailedToDuplicateItem => 'فشل تكرار العنصر';

  @override
  String get orderLineSuccess => 'نجاح';

  @override
  String get orderLineItemRemoved => 'تمت إزالة العنصر';

  @override
  String get orderLineFailedToRemoveItem => 'فشلت إزالة العنصر';

  @override
  String get orderLineItemAdded => 'تمت إضافة العنصر';

  @override
  String get orderLineFailedToReplaceTheItem => 'فشل استبدال العنصر';

  @override
  String get orderLineReplaceProductVariants => 'استبدال متغيرات المنتج';

  @override
  String get orderLineReplaceWithOtherItem => 'استبدال بعنصر آخر';

  @override
  String get orderLineDuplicateItem => 'تكرار العنصر';

  @override
  String get orderLineRemoveItem => 'إزالة العنصر';

  @override
  String get orderLineLineItemCannotBeEdited =>
      'لا يمكن تعديل عنصر الخط هذا. ألغِ التنفيذ لتعديل عنصر الخط.';

  @override
  String get orderLineNew => 'جديد';

  @override
  String get orderLineModified => 'معدل';

  @override
  String get receiveReturnPleaseSelectAtLeastOneItemToReceive =>
      'الرجاء تحديد عنصر واحد على الأقل للاستلام';

  @override
  String get receiveReturnSuccessfullyReceivedReturn =>
      'تم استلام العودة بنجاح';

  @override
  String receiveReturnReceivedReturnForOrder(String display_id) {
    return 'تم استلام العودة للطلب رقم #$display_id';
  }

  @override
  String get receiveReturnFailedToReceiveReturn => 'فشل استلام العودة';

  @override
  String get receiveReturnReceiveReturn => 'استلام العودة';

  @override
  String get receiveReturnLocation => 'الموقع';

  @override
  String get receiveReturnChooseLocation =>
      'اختر الموقع الذي تريد إعادة العناصر إليه.';

  @override
  String get receiveReturnSelectLocationToReturnTo => 'حدد الموقع للإرجاع إليه';

  @override
  String
      get receiveReturnNoInventoryLevelsExistForTheItemsAtTheSelectedLocation =>
          'لا توجد مستويات مخزون للعناصر في الموقع المحدد';

  @override
  String get receiveReturnCancel => 'إلغاء';

  @override
  String get receiveReturnSaveAndClose => 'حفظ وإغلاق';

  @override
  String get refundSuccess => 'نجاح';

  @override
  String get refundSuccessfullyRefundedOrder => 'تم استرداد الطلب بنجاح';

  @override
  String get refundError => 'حدث خطأ';

  @override
  String get refundCreateARefund => 'إنشاء استرداد';

  @override
  String get refundAttention => 'انتباه!';

  @override
  String get refundSystemPaymentDisclaimer =>
      'واحد أو أكثر من مدفوعاتك هو دفع نظام. كن على دراية بأن التقاط واسترداد الأموال لا يتم التعامل معها من قِبل Medusa بالنسبة لمثل هذه المدفوعات.';

  @override
  String get refundDetails => 'التفاصيل';

  @override
  String get refundCannotRefundMoreThanTheOrdersNetTotal =>
      'لا يمكن استرداد أكثر من إجمالي صافي الطلب.';

  @override
  String get refundPromotion => 'Promotion';

  @override
  String get refundReason => 'السبب';

  @override
  String get refundNote => 'ملاحظة';

  @override
  String get refundPromotionForLoyalCustomer => 'Promotion for loyal customer';

  @override
  String get refundSendNotifications => 'إرسال إشعارات';

  @override
  String get refundCancel => 'إلغاء';

  @override
  String get refundComplete => 'اكتمال';

  @override
  String get reservationReservationWasDeleted => 'تم حذف الحجز';

  @override
  String get reservationTheAllocatedItemsHaveBeenReleased =>
      'تم إطلاق العناصر المخصصة.';

  @override
  String get reservationError => 'حدث خطأ';

  @override
  String get reservationFailedToDeleteTheReservation => 'فشل حذف الحجز';

  @override
  String get reservationReservationWasUpdated => 'تم تحديث الحجز';

  @override
  String get reservationTheReservationChangeWasSaved => 'تم حفظ تغيير الحجز.';

  @override
  String get reservationErrors => 'أخطاء';

  @override
  String get reservationFailedToUpdateReservation => 'فشل تحديث الحجز';

  @override
  String get reservationEditReservation => 'تحرير الحجز';

  @override
  String get reservationLocation => 'الموقع';

  @override
  String get reservationChooseWhichLocationYouWantToShipTheItemsFrom =>
      'اختر الموقع الذي تريد شحن العناصر منه.';

  @override
  String get reservationItemsToAllocateTitle => 'عناصر للتخصيص';

  @override
  String get reservationSelectTheNumberOfItemsThatYouWishToAllocate =>
      'حدد عدد العناصر التي ترغب في تخصيصها.';

  @override
  String reservationMaxReservationRequested(String maxReservation) {
    return ' / $maxReservation مطلوب';
  }

  @override
  String get reservationReserved => ' محجوز';

  @override
  String get reservationDescription => 'الوصف';

  @override
  String get reservationWhatTypeOfReservationIsThis => 'ما نوع هذا الحجز؟';

  @override
  String get reservationMetadata => 'البيانات الوصفية';

  @override
  String get reservationRemoveMetadata => 'إزالة البيانات الوصفية';

  @override
  String get reservationAddMetadata => 'إضافة بيانات وصفية';

  @override
  String get reservationDeleteReservation => 'حذف الحجز';

  @override
  String get reservationCancel => 'إلغاء';

  @override
  String get reservationSaveAndClose => 'حفظ وإغلاق';

  @override
  String get reservationCouldntAllocateItems => 'تعذر تخصيص العناصر';

  @override
  String get reservationItemsAllocated => 'تم تخصيص العناصر';

  @override
  String get reservationItemsHaveBeenAllocatedSuccessfully =>
      'تم تخصيص العناصر بنجاح';

  @override
  String get reservationSaveReservation => 'حفظ الحجز';

  @override
  String get reservationLoading => 'جار التحميل...';

  @override
  String get reservationAllocateOrderItems => 'تخصيص عناصر الطلب';

  @override
  String get reservationChooseWhereYouWishToAllocateFrom =>
      'اختر المكان الذي ترغب في التخصيص منه';

  @override
  String get reservationItemsToAllocate => 'العناصر للتخصيص';

  @override
  String get returnsSuccess => 'نجاح';

  @override
  String get returnsSuccessfullyReturnedOrder => 'تمت إعادة الطلب بنجاح';

  @override
  String get returnsError => 'حدث خطأ';

  @override
  String get returnsRequestReturn => 'طلب إعادة';

  @override
  String get returnsItemsToReturn => 'العناصر للإعادة';

  @override
  String get returnsChooseWhichLocationYouWantToReturnTheItemsTo =>
      'اختر الموقع الذي تريد إعادة العناصر إليه.';

  @override
  String get returnsSelectLocationToReturnTo => 'حدد الموقع للإعادة إليه';

  @override
  String get returnsSelectedLocationHasNoInventoryLevels =>
      'لا يحتوي الموقع المحدد على مستويات مخزون للعناصر المحددة. يمكن طلب الإعادة ولكن لا يمكن استلامها حتى يتم إنشاء مستوى مخزون للموقع المحدد.';

  @override
  String get returnsShipping => 'الشحن';

  @override
  String get returnsChooseReturShippingMethod =>
      'Choose which shipping method you want to use for this return.';

  @override
  String get returnsTotalRefund => 'إجمالي الاسترداد';

  @override
  String get returnsAmount => 'المبلغ';

  @override
  String get returnsSendNotifications => 'إرسال إشعارات';

  @override
  String get returnsNotifyCustomerOfCreatedReturn =>
      'إخطار العميل بإنشاء الإعادة';

  @override
  String get returnsBack => 'العودة';

  @override
  String get returnsSubmit => 'إرسال';

  @override
  String get rmaSubModalsSearchForAdditional => 'البحث عن إضافي';

  @override
  String get rmaSubModalsGeneral => 'عام';

  @override
  String get rmaSubModalsFirstName => 'الاسم الأول';

  @override
  String get rmaSubModalsLastName => 'اسم العائلة';

  @override
  String get rmaSubModalsPhone => 'هاتف';

  @override
  String get rmaSubModalsShippingAddress => 'عنوان الشحن';

  @override
  String get rmaSubModalsAddress1 => 'العنوان 1';

  @override
  String get rmaSubModalsAddress2 => 'العنوان 2';

  @override
  String get rmaSubModalsProvince => 'المحافظة';

  @override
  String get rmaSubModalsPostalCode => 'الرمز البريدي';

  @override
  String get rmaSubModalsCity => 'المدينة';

  @override
  String get rmaSubModalsCountry => 'البلد';

  @override
  String get rmaSubModalsBack => 'العودة';

  @override
  String get rmaSubModalsAdd => 'إضافة';

  @override
  String get rmaSubModalsName => 'الاسم';

  @override
  String get rmaSubModalsStatus => 'الحالة';

  @override
  String get rmaSubModalsInStock => 'متوفر';

  @override
  String get rmaSubModalsProducts => 'المنتجات';

  @override
  String get rmaSubModalsSearchProducts => 'البحث عن منتجات..';

  @override
  String get rmaSubModalsReasonForReturn => 'سبب الإعادة';

  @override
  String get rmaSubModalsReason => 'السبب';

  @override
  String get rmaSubModalsNote => 'ملاحظة';

  @override
  String get swapSuccess => 'نجاح';

  @override
  String get swapSuccessfullyCreatedExchange => 'تم إنشاء المبادلة بنجاح';

  @override
  String get swapError => 'حدث خطأ';

  @override
  String get swapRegisterExchange => 'تسجيل مبادلة';

  @override
  String get swapItemsToReturn => 'العناصر للإعادة';

  @override
  String get swapShipping => 'الشحن';

  @override
  String get swapShippingMethod => 'طريقة الشحن';

  @override
  String get swapAddAShippingMethod => 'إضافة طريقة شحن';

  @override
  String get swapLocation => 'الموقع';

  @override
  String get swapChooseWhichLocationYouWantToReturnTheItemsTo =>
      'اختر الموقع الذي تريد إعادة العناصر إليه.';

  @override
  String get swapSelectLocationToReturnTo => 'حدد الموقع للإرجاع إليه';

  @override
  String get swapItemsToSend => 'العناصر للإرسال';

  @override
  String get swapAddProduct => 'إضافة منتج';

  @override
  String get swapReturnTotal => 'إجمالي الإعادة';

  @override
  String get swapAdditionalTotal => 'المجموع الإضافي';

  @override
  String get swapOutbondShipping => 'الشحنة الصادرة';

  @override
  String get swapCalculatedAtCheckout => 'يحسب عند الخروج';

  @override
  String get swapEstimatedDifference => 'الفرق المقدر';

  @override
  String get swapSendNotifications => 'إرسال إشعارات';

  @override
  String
      get swapIfUncheckedTheCustomerWillNotReceiveCommunicationAboutThisExchange =>
          'إذا لم يتم تحديده ، فلن يتلقى العميل أي اتصال حول هذه المبادلة';

  @override
  String get swapComplete => 'اكتمال';

  @override
  String get templatesShipped => 'تم الشحن';

  @override
  String get templatesFulfilled => 'تم الوفاء به';

  @override
  String get templatesCanceled => 'ألغيت';

  @override
  String get templatesPartiallyFulfilled => 'تم الوفاء به جزئيًا';

  @override
  String get templatesFulfillmentStatusRequiresAction => 'يتطلب إجراء';

  @override
  String get templatesAwaitingFulfillment => 'في انتظار التنفيذ';

  @override
  String get templatesPartiallyShipped => 'تم شحنه جزئيًا';

  @override
  String get templatesCancelFulfillmentHeading => 'إلغاء التنفيذ؟';

  @override
  String get templatesAreYouSureYouWantToCancelTheFulfillment =>
      'هل أنت متأكد أنك تريد إلغاء التنفيذ؟';

  @override
  String get templatesSuccessfullyCanceledSwap => 'تم إلغاء المبادلة بنجاح';

  @override
  String get templatesError => 'حدث خطأ';

  @override
  String get templatesSuccessfullyCanceledClaim => 'تم إلغاء المطالبة بنجاح';

  @override
  String get templatesSuccessfullyCanceledFulfillment =>
      'تم إلغاء التنفيذ بنجاح';

  @override
  String get templatesFulfillmentHasBeenCanceled => 'تم إلغاء التنفيذ';

  @override
  String templatesFulfilledByProvider(String title, String provider) {
    return '$title تم تنفيذه بواسطة $provider';
  }

  @override
  String get templatesNotShipped => 'لم يتم الشحن';

  @override
  String get templatesTracking => 'التتبع';

  @override
  String get templatesShippedFrom => 'تم الشحن من';

  @override
  String get templatesShippingFrom => 'الشحن من';

  @override
  String get templatesMarkShipped => 'وضع علامة كمشحون';

  @override
  String get templatesCancelFulfillment => 'إلغاء التنفيذ';

  @override
  String get templatesCompleted => 'مكتمل';

  @override
  String get templatesProcessing => 'قيد المعالجة';

  @override
  String get templatesRequiresAction => 'يتطلب إجراء';

  @override
  String get templatesCapturePayment => 'التقاط الدفع';

  @override
  String get templatesSuccessfullyCapturedPayment => 'تم التقاط الدفع بنجاح';

  @override
  String get templatesRefund => 'استرداد';

  @override
  String get templatesTotalForSwaps => 'المجموع للمبادلات';

  @override
  String get templatesRefundedForSwaps => 'تم استرداده للمبادلات';

  @override
  String get templatesRefundedForReturns => 'تم استرداده للمرتجعات';

  @override
  String get templatesManuallyRefunded => 'تم استرداده يدويًا';

  @override
  String get templatesNetTotal => 'المجموع الصافي';

  @override
  String get templatesPaid => 'مدفوع';

  @override
  String get templatesAwaitingPayment => 'في انتظار الدفع';

  @override
  String get templatesPaymentStatusRequiresAction => 'يتطلب إجراء';

  @override
  String get draftOrdersCompleted => 'مكتمل';

  @override
  String get draftOrdersOpen => 'مفتوح';

  @override
  String get draftOrdersMarkAsPaid => 'وضع علامة كمدفوع';

  @override
  String get draftOrdersSuccess => 'نجاح';

  @override
  String get draftOrdersSuccessfullyMarkAsPaid => 'تم وضع علامة كمدفوع بنجاح';

  @override
  String get draftOrdersError => 'حدث خطأ';

  @override
  String get draftOrdersSuccessfullyCanceledOrder => 'تم إلغاء الطلب بنجاح';

  @override
  String get draftOrdersBackToDraftOrders => 'العودة إلى مسودات الطلبات';

  @override
  String onMarkAsPaidConfirmOrderId(String displayId, Object display_id) {
    return 'الطلب رقم #$display_id';
  }

  @override
  String get draftOrdersGoToOrder => 'الذهاب إلى الطلب';

  @override
  String get draftOrdersCancelDraftOrder => 'إلغاء مسودة الطلب';

  @override
  String get draftOrdersDraftOrder => 'مسودة الطلب';

  @override
  String get draftOrdersEmail => 'البريد الإلكتروني';

  @override
  String get draftOrdersPhone => 'هاتف';

  @override
  String draftOrdersAmount(String currencyCode, Object currency_code) {
    return 'المبلغ $currency_code';
  }

  @override
  String get draftOrdersPayment => 'الدفع';

  @override
  String get draftOrdersSubtotal => 'المجموع الفرعي';

  @override
  String get draftOrdersShipping => 'الشحن';

  @override
  String get draftOrdersTax => 'الضريبة';

  @override
  String get draftOrdersTotalToPay => 'المجموع الواجب دفعه';

  @override
  String get draftOrdersPaymentLink => 'رابط الدفع:';

  @override
  String get draftOrdersConfigurePaymentLinkInStoreSettings =>
      'قم بتكوين رابط الدفع في إعدادات المتجر';

  @override
  String get draftOrdersShippingMethod => 'طريقة الشحن';

  @override
  String get draftOrdersData => 'البيانات';

  @override
  String get draftOrders1Item => '(1 عنصر)';

  @override
  String get draftOrdersCustomer => 'العميل';

  @override
  String get draftOrdersEditShippingAddress => 'تحرير عنوان الشحن';

  @override
  String get draftOrdersEditBillingAddress => 'تحرير عنوان الفوترة';

  @override
  String get draftOrdersGoToCustomer => 'الذهاب إلى العميل';

  @override
  String get draftOrdersContact => 'جهة الاتصال';

  @override
  String get draftOrdersBilling => 'الفوترة';

  @override
  String get draftOrdersRawDraftOrder => 'مسودة الطلب الأصلية';

  @override
  String get draftOrdersAreYouSure => 'هل أنت متأكد؟';

  @override
  String draftOrdersRemoveResourceHeading(String resource) {
    return 'إزالة $resource';
  }

  @override
  String draftOrdersRemoveResourceSuccessText(String resource) {
    return 'تمت إزالة $resource';
  }

  @override
  String
      get draftOrdersThisWillCreateAnOrderMarkThisAsPaidIfYouReceivedThePayment =>
          'سينشئ هذا طلبًا. ضع علامة كمدفوع إذا تلقيت الدفع.';

  @override
  String get draftOrdersMarkPaid => 'وضع علامة كمدفوع';

  @override
  String get draftOrdersCancel => 'إلغاء';

  @override
  String get draftOrdersCreateDraftOrder => 'إنشاء مسودة طلب';

  @override
  String get editAmountPaid => 'المبلغ المدفوع';

  @override
  String get editNewTotal => 'المجموع الجديد';

  @override
  String get editDifferenceDue => 'الفرق المستحق';

  @override
  String get editBack => 'العودة';

  @override
  String get editSaveAndGoBack => 'حفظ والعودة';

  @override
  String get editOrderEditSetAsRequested => 'تم تعيين تحرير الطلب كمطلوب';

  @override
  String get editFailedToRequestConfirmation => 'فشل طلب التأكيد';

  @override
  String get editAddedSuccessfully => 'تمت الإضافة بنجاح';

  @override
  String get editErrorOccurred => 'حدث خطأ';

  @override
  String get editAddProductVariants => 'إضافة متغيرات المنتج';

  @override
  String get editEditOrder => 'تعديل الطلب';

  @override
  String get editItems => 'العناصر';

  @override
  String get editAddItems => 'إضافة عناصر';

  @override
  String get editFilterItems => 'تصفية العناصر...';

  @override
  String get editNote => 'ملاحظة';

  @override
  String get editAddANote => 'إضافة ملاحظة...';

  @override
  String variantsTableLocation(String location) {
    return ' في $location';
  }

  @override
  String get editProduct => 'المنتج';

  @override
  String get editInStock => 'متوفر';

  @override
  String get editPrice => 'السعر';

  @override
  String get editProducts => 'المنتجات';

  @override
  String get editSearchProductVariants => 'بحث متغيرات المنتج...';

  @override
  String get ordersSuccess => 'نجاح';

  @override
  String get ordersSuccessfullyInitiatedExport => 'تم بدء التصدير بنجاح';

  @override
  String get ordersError => 'حدث خطأ';

  @override
  String get ordersExportOrders => 'تصدير الطلبات';

  @override
  String get componentsBillingAddress => 'عنوان الفوترة';

  @override
  String get componentsUseSameAsShipping => 'استخدام نفس عنوان الشحن';

  @override
  String get componentsEGGiftWrapping => 'مثال: تغليف الهدايا';

  @override
  String get componentsTitle => 'العنوان';

  @override
  String get componentsPrice => 'السعر';

  @override
  String get componentsQuantity => 'الكمية';

  @override
  String get componentsBack => 'العودة';

  @override
  String get componentsAdd => 'إضافة';

  @override
  String get componentsItemsForTheOrder => 'عناصر الطلب';

  @override
  String get componentsDetails => 'التفاصيل';

  @override
  String get componentsPriceExclTaxes => 'السعر (باستثناء الضرائب)';

  @override
  String get componentsAddCustom => 'إضافة مخصص';

  @override
  String get componentsAddExisting => 'إضافة موجود';

  @override
  String get componentsAddProducts => 'إضافة منتجات';

  @override
  String get componentsAddCustomItem => 'إضافة عنصر مخصص';

  @override
  String get componentsChooseRegion => 'اختر المنطقة';

  @override
  String get componentsRegion => 'المنطقة';

  @override
  String selectShippingToName(String name) {
    return '(إلى $name)';
  }

  @override
  String get componentsAttention => 'انتباه!';

  @override
  String get componentsNoOptionsForOrdersWithoutShipping =>
      'ليس لديك أي خيارات للطلبات بدون شحن. يرجى إضافة واحد (مثل التنفيذ داخل المتجر) مع إلغاء تحديد إظهار على الموقع في إعدادات المنطقة والمتابعة.';

  @override
  String get componentsChooseAShippingMethod => 'اختر طريقة الشحن';

  @override
  String get componentsSetCustomPrice => 'تعيين سعر مخصص';

  @override
  String get componentsCustomPrice => 'السعر المخصص';

  @override
  String get componentsCustomerAndShippingDetails => 'تفاصيل العميل والشحن';

  @override
  String get componentsFindExistingCustomer => 'العثور على عميل موجود';

  @override
  String get componentsEmail => 'البريد الإلكتروني';

  @override
  String get componentsChooseExistingAddresses => 'اختر العناوين الموجودة';

  @override
  String get componentsCreateNew => 'إنشاء جديد';

  @override
  String get componentsThePromotionIsNotApplicableToTheSelectedRegion =>
      'The promotion is not applicable to the selected region';

  @override
  String get componentsThePromotionCodeIsInvalid =>
      'The promotion code is invalid';

  @override
  String get componentsAddPromotion => 'Add Promotion';

  @override
  String get componentsSummer10 => 'صيف10';

  @override
  String get componentsPromotion => 'Promotion';

  @override
  String selectShippingCode(String code) {
    return '(الرمز: $code)';
  }

  @override
  String get componentsType => 'النوع';

  @override
  String get componentsValue => 'القيمة';

  @override
  String get componentsAddress => 'العنوان';

  @override
  String get componentsShippingMethod => 'طريقة الشحن';

  @override
  String get componentsBillingDetails => 'تفاصيل الفوترة';

  @override
  String get componentsEdit => 'تعديل';

  @override
  String get formUseNewOrderFormMustBeUsedWithinNewOrderFormProvider =>
      'يجب استخدام useNewOrderForm داخل NewOrderFormProvider';

  @override
  String get newOrderCreated => 'تم إنشاء الطلب';

  @override
  String get newCreateDraftOrder => 'إنشاء مسودة طلب';

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
  String get componentsSuccess => 'نجاح';

  @override
  String get componentsSuccessfullyUpdatedCategoryTree =>
      'تم تحديث شجرة الفئات بنجاح';

  @override
  String get componentsError => 'حدث خطأ';

  @override
  String get componentsFailedToUpdateCategoryTree => 'فشل تحديث شجرة الفئات';

  @override
  String get componentsDelete => 'حذف';

  @override
  String get componentsCategoryDeleted => 'تم حذف الفئة';

  @override
  String get componentsCategoryDeletionFailed => 'فشل حذف الفئة';

  @override
  String get componentsCategoryStatusIsInactive => 'حالة الفئة غير نشطة';

  @override
  String get componentsCategoryVisibilityIsPrivate => 'رؤية الفئة خاصة';

  @override
  String get componentsAddCategoryItemTo => 'إضافة عنصر الفئة إلى';

  @override
  String get modalsPublic => 'عام';

  @override
  String get modalsPrivate => 'خاص';

  @override
  String get modalsActive => 'نشط';

  @override
  String get modalsInactive => 'غير نشط';

  @override
  String get modalsSuccess => 'نجاح';

  @override
  String get modalsSuccessfullyCreatedACategory => 'تم إنشاء فئة بنجاح';

  @override
  String get modalsFailedToCreateANewCategory => 'فشل إنشاء فئة جديدة';

  @override
  String get modalsError => 'حدث خطأ';

  @override
  String get modalsSaveCategory => 'حفظ الفئة';

  @override
  String modalsAddCategoryTo(String name) {
    return 'إضافة فئة إلى $name';
  }

  @override
  String get modalsAddCategory => 'إضافة فئة';

  @override
  String get modalsDetails => 'التفاصيل';

  @override
  String get modalsName => 'الاسم';

  @override
  String get modalsGiveThisCategoryAName => 'أعط هذه الفئة اسمًا';

  @override
  String get modalsHandle => 'المُعالج';

  @override
  String get modalsCustomHandle => 'مُعالج مخصص';

  @override
  String get modalsDescription => 'الوصف';

  @override
  String get modalsGiveThisCategoryADescription => 'أعط هذه الفئة وصفًا';

  @override
  String get modalsStatus => 'الحالة';

  @override
  String get modalsVisibility => 'الرؤية';

  @override
  String get modalsSuccessfullyUpdatedTheCategory => 'تم تحديث الفئة بنجاح';

  @override
  String get modalsFailedToUpdateTheCategory => 'فشل تحديث الفئة';

  @override
  String get modalsEditProductCategory => 'تحرير فئة المنتج';

  @override
  String get modalsCancel => 'إلغاء';

  @override
  String get modalsSaveAndClose => 'حفظ وإغلاق';

  @override
  String get pagesNoProductCategoriesYet =>
      'لا توجد فئات منتج بعد ، استخدم الزر أعلاه لإنشاء أول فئة لك.';

  @override
  String get pagesAddCategory => 'إضافة فئة';

  @override
  String get pagesProductCategories => 'فئات المنتجات';

  @override
  String get pagesHelpsYouToKeepYourProductsOrganized =>
      'يساعدك على الحفاظ على تنظيم منتجاتك.';

  @override
  String get batchJobSuccess => 'نجاح';

  @override
  String
      get batchJobImportConfirmedForProcessingProgressInfoIsAvailableInTheActivityDrawer =>
          'تم تأكيد الاستيراد للمعالجة. معلومات التقدم متاحة في لائحة الأنشطة.';

  @override
  String get batchJobError => 'حدث خطأ';

  @override
  String get batchJobImportFailed => 'فشل الاستيراد.';

  @override
  String get batchJobFailedToDeleteTheCsvFile => 'فشل حذف ملف CSV';

  @override
  String get batchJobFailedToCancelTheBatchJob => 'فشل إلغاء المهمة المجمعة';

  @override
  String get batchJobProductsList => 'قائمة المنتجات';

  @override
  String get batchJobUnsureAboutHowToArrangeYourList =>
      'غير متأكد من كيفية ترتيب قائمتك؟';

  @override
  String get batchJobDownloadTemplate =>
      'قم بتنزيل القالب أدناه للتأكد من اتباعك التنسيق الصحيح.';

  @override
  String get batchJobImportsDescription =>
      'من خلال الاستيراد ، يمكنك إضافة منتجات أو تحديثها. لتحديث المنتجات / المتغيرات الموجودة ، يجب تعيين معرف موجود في أعمدة معرف المنتج / المتغير. إذا كانت القيمة غير معينة، سيتم إنشاء سجل جديد. سيُطلب منك التأكيد قبل استيراد المنتجات.';

  @override
  String get productsFilters => 'الفلاتر';

  @override
  String get productsStatus => 'الحالة';

  @override
  String get productsTags => 'العلامات';

  @override
  String get productsSpringSummer => 'الربيع ، الصيف...';

  @override
  String get newSalesChannels => 'قنوات المبيعات';

  @override
  String get newThisProductWillOnlyBeAvailableInTheDefaultSalesChannelIfLeftUntouched =>
      'سيكون هذا المنتج متاحًا فقط في قناة المبيعات الافتراضية إذا ترك دون مساس.';

  @override
  String get newChangeAvailablity => 'تغيير التوفر';

  @override
  String get addVariantsAVariantWithTheseOptionsAlreadyExists =>
      'يوجد بالفعل متغير بهذه الخيارات.';

  @override
  String get addVariantsProductOptions => 'خيارات المنتج';

  @override
  String get addVariantsOptionsAreUsedToDefineTheColorSizeEtcOfTheProduct =>
      'تُستخدم الخيارات لتحديد اللون والحجم وما إلى ذلك من المنتج.';

  @override
  String get addVariantsOptionTitle => 'عنوان الخيار';

  @override
  String get addVariantsVariationsCommaSeparated =>
      'الاختلافات (مفصولة بفواصل)';

  @override
  String get addVariantsColor => 'اللون...';

  @override
  String get addVariantsAlreadyExists => 'موجود بالفعل';

  @override
  String get addVariantsBlueRedBlack => 'أزرق، أحمر، أسود...';

  @override
  String get addVariantsAddAnOption => 'إضافة خيار';

  @override
  String get addVariantsProductVariants => 'متغيرات المنتج';

  @override
  String get addVariantsYouMustAddAtLeastOneProductOptionBeforeYouCanBeginAddingProductVariants =>
      'يجب عليك إضافة خيار منتج واحد على الأقل قبل أن تتمكن من البدء في إضافة متغيرات المنتج.';

  @override
  String get addVariantsVariant => 'المتغير';

  @override
  String get addVariantsInventory => 'المخزون';

  @override
  String get addVariantsAddAVariant => 'إضافة متغير';

  @override
  String get addVariantsCreateVariant => 'إنشاء متغير';

  @override
  String get addVariantsCancel => 'إلغاء';

  @override
  String get addVariantsSaveAndClose => 'حفظ وإغلاق';

  @override
  String get newVariantAVariantWithTheseOptionsAlreadyExists =>
      'يوجد بالفعل متغير بهذه الخيارات.';

  @override
  String get newVariantAreYouSureYouWantToDeleteThisVariant =>
      'هل أنت متأكد أنك تريد حذف هذا المتغير؟';

  @override
  String get newVariantDeleteVariant => 'حذف المتغير';

  @override
  String get newVariantEdit => 'تعديل';

  @override
  String get newVariantDelete => 'حذف';

  @override
  String get newVariantEditVariant => 'تعديل المتغير';

  @override
  String get newVariantCancel => 'إلغاء';

  @override
  String get newVariantSaveAndClose => 'حفظ وإغلاق';

  @override
  String get newSomethingWentWrongWhileTryingToUploadImages =>
      'حدث خطأ ما أثناء محاولة تحميل الصور.';

  @override
  String get newNoFileServiceConfigured =>
      'قد لا يكون لديك خدمة ملفات مهيأة. يرجى الاتصال بالمسؤول الخاص بك';

  @override
  String get newUploadThumbnailError =>
      'حدث خطأ ما أثناء محاولة تحميل الصورة المصغرة.';

  @override
  String get newSaveAsDraft => 'حفظ كمسودة';

  @override
  String get newPublishProduct => 'نشر المنتج';

  @override
  String get newGeneralInformationTitle => 'معلومات عامة';

  @override
  String get newToStartSellingAllYouNeedIsANameAndAPrice =>
      'لبدء البيع، كل ما تحتاجه هو اسم وسعر.';

  @override
  String get newOrganizeProduct => 'تنظيم المنتج';

  @override
  String get newAddVariationsOfThisProduct => 'إضافة اختلافات لهذا المنتج.';

  @override
  String get newOfferYourCustomersDifferentOptionsForColorFormatSizeShapeEtc =>
      'قدِّم لعملائك خيارات مختلفة للون والتنسيق والحجم والشكل وما إلى ذلك.';

  @override
  String get newUsedForShippingAndCustomsPurposes =>
      'يستخدم لأغراض الشحن والجمارك.';

  @override
  String get newDimensions => 'الأبعاد';

  @override
  String get newCustoms => 'الجمارك';

  @override
  String get newUsedToRepresentYourProductDuringCheckoutSocialSharingAndMore =>
      'يُستخدم لتمثيل منتجك أثناء الدفع ومشاركة وسائل التواصل الاجتماعي وغيرها.';

  @override
  String get newMedia => 'وسائط';

  @override
  String get newAddImagesToYourProduct => 'أضف صورًا لمنتجك.';

  @override
  String get overviewImportProducts => 'استيراد المنتجات';

  @override
  String get overviewExportProducts => 'تصدير المنتجات';

  @override
  String get overviewNewProduct => 'منتج جديد';

  @override
  String get overviewNewCollection => 'مجموعة جديدة';

  @override
  String get overviewSuccess => 'نجاح';

  @override
  String get overviewSuccessfullyCreatedCollection => 'تم إنشاء المجموعة بنجاح';

  @override
  String get overviewError => 'حدث خطأ';

  @override
  String get overviewSuccessfullyInitiatedExport => 'تم بدء التصدير بنجاح';

  @override
  String get modalsAddSalesChannels => 'إضافة قنوات مبيعات';

  @override
  String get modalsFindChannels => 'العثور على القنوات';

  @override
  String get modalsUpdatedTheApiKey => 'تم تحديث مفتاح API';

  @override
  String get modalsFailedToUpdateTheApiKey => 'فشل تحديث مفتاح API';

  @override
  String get modalsEditApiKeyDetails => 'تحرير تفاصيل مفتاح API';

  @override
  String get modalsTitle => 'العنوان';

  @override
  String get modalsNameYourKey => 'سمّ مفتاحك';

  @override
  String get modalsSalesChannelsAddedToTheScope =>
      'تمت إضافة قنوات المبيعات إلى النطاق';

  @override
  String get modalsErrorOccurredWhileAddingSalesChannelsToTheScopeOfTheKey =>
      'حدث خطأ أثناء إضافة قنوات المبيعات إلى نطاق المفتاح';

  @override
  String get modalsAddAndGoBack => 'إضافة والعودة';

  @override
  String get modalsAddAndClose => 'إضافة وإغلاق';

  @override
  String get modalsSalesChannelsRemovedFromTheScope =>
      'تمت إزالة قنوات المبيعات من النطاق';

  @override
  String
      get modalsErrorOccurredWhileRemovingSalesChannelsFromTheScopeOfTheKey =>
          'حدث خطأ أثناء إزالة قنوات المبيعات من نطاق المفتاح';

  @override
  String get modalsEditSalesChannels => 'تحرير قنوات المبيعات';

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
  String get modalsDeselect => 'إلغاء التحديد';

  @override
  String get modalsRemove => 'إزالة';

  @override
  String get modalsAddChannels => 'إضافة قنوات';

  @override
  String get modalsClose => 'إغلاق';

  @override
  String get pagesSalesChannels => 'قنوات المبيعات';

  @override
  String get pagesConnectAsManySalesChannelsToYourApiKeyAsYouNeed =>
      'اربط أي عدد من قنوات المبيعات بمفتاح API الخاص بك حسب الحاجة.';

  @override
  String get pagesAddSalesChannels => 'إضافة قنوات مبيعات';

  @override
  String get pagesEditSalesChannels => 'تحرير قنوات المبيعات';

  @override
  String get pagesSuccess => 'نجاح';

  @override
  String get pagesCreatedANewApiKey => 'تم إنشاء مفتاح API جديد';

  @override
  String get pagesError => 'حدث خطأ';

  @override
  String get pagesFailedToCreateANewApiKey => 'فشل إنشاء مفتاح API جديد';

  @override
  String get pagesSalesChannelsAddedToTheScope =>
      'تمت إضافة قنوات المبيعات إلى النطاق';

  @override
  String get pagesErrorOccurredWhileAddingSalesChannelsToTheScopeOfTheKey =>
      'حدث خطأ أثناء إضافة قنوات المبيعات إلى نطاق المفتاح';

  @override
  String get pagesPublishApiKey => 'نشر مفتاح API';

  @override
  String get pagesCreateApiKey => 'إنشاء مفتاح API';

  @override
  String
      get pagesCreateAndManageApiKeysRightNowThisIsOnlyRelatedToSalesChannels =>
          'إنشاء وإدارة مفاتيح API. حاليًا هذا متعلق فقط بقنوات المبيعات';

  @override
  String get pagesCreateApiKeyLabel => 'إنشاء مفتاح API';

  @override
  String get pagesBackToSettings => 'العودة إلى الإعدادات';

  @override
  String get pagesPublishableApiKeys => 'مفاتيح API قابلة للنشر';

  @override
  String get pagesThesePublishableKeysWillAllowYouToAuthenticateApiRequests =>
      'ستسمح لك هذه المفاتيح القابلة للنشر بالمصادقة على طلبات API.';

  @override
  String get tablesName => 'الاسم';

  @override
  String get tablesToken => 'الرمز';

  @override
  String get tablesDone => 'تم';

  @override
  String get tablesCopyToClipboard => 'نسخ إلى الحافظة';

  @override
  String get tablesCreated => 'تم إنشاؤه';

  @override
  String get tablesStatus => 'الحالة';

  @override
  String get tablesRevoked => 'تم إلغاؤه';

  @override
  String get tablesLive => 'نشط';

  @override
  String get tablesEditApiKeyDetails => 'تحرير تفاصيل مفتاح API';

  @override
  String get tablesEditSalesChannels => 'تحرير قنوات المبيعات';

  @override
  String get tablesCopyToken => 'نسخ الرمز';

  @override
  String get tablesRevokeToken => 'إلغاء الرمز';

  @override
  String get tablesDeleteApiKey => 'حذف مفتاح API';

  @override
  String get tablesYesDelete => 'نعم، احذف';

  @override
  String get tablesApiKeyDeleted => 'تم حذف مفتاح API';

  @override
  String get tablesAreYouSureYouWantToDeleteThisPublicKey =>
      'هل أنت متأكد أنك تريد حذف هذا المفتاح العام؟';

  @override
  String get tablesDeleteKey => 'حذف المفتاح';

  @override
  String get tablesYesRevoke => 'نعم، ألغِ';

  @override
  String get tablesApiKeyRevoked => 'تم إلغاء مفتاح API';

  @override
  String get tablesAreYouSureYouWantToRevokeThisPublicKey =>
      'هل أنت متأكد أنك تريد إلغاء هذا المفتاح العام؟';

  @override
  String get tablesRevokeKey => 'إلغاء المفتاح';

  @override
  String get tablesApiKeys => 'مفاتيح API';

  @override
  String get tablesNoKeysYetUseTheAboveButtonToCreateYourFirstPublishableKey =>
      'لا توجد مفاتيح بعد، استخدم الزر أعلاه لإنشاء أول مفتاح قابل للنشر لك';

  @override
  String get tablesTitle => 'العنوان';

  @override
  String get tablesDescription => 'الوصف';

  @override
  String get tablesNoAddedSalesChannels => 'لم تتم إضافة قنوات مبيعات';

  @override
  String get tablesSalesChannels => 'قنوات المبيعات';

  @override
  String get formTitle => 'العنوان';

  @override
  String get formWebsiteAppAmazonPhysicalStorePosFacebookProductFeed =>
      'الموقع الإلكتروني ، التطبيق ، أمازون ، المتجر المادي ، نقاط البيع ، تغذية المنتج في فيسبوك...';

  @override
  String get formDescription => 'الوصف';

  @override
  String get formAvailableProductsAtOurWebsiteApp =>
      'المنتجات المتاحة على موقعنا الإلكتروني ، التطبيق...';

  @override
  String get formSuccess => 'نجاح';

  @override
  String get formTheSalesChannelIsSuccessfullyUpdated =>
      'تم تحديث قناة المبيعات بنجاح';

  @override
  String get formError => 'حدث خطأ';

  @override
  String get formFailedToUpdateTheSalesChannel => 'فشل تحديث قناة المبيعات';

  @override
  String get formSalesChannelDetails => 'تفاصيل قناة المبيعات';

  @override
  String get formGeneralInfo => 'معلومات عامة';

  @override
  String get formName => 'الاسم';

  @override
  String get formClose => 'إغلاق';

  @override
  String get formSave => 'حفظ';

  @override
  String get pagesDraft => 'مسودة';

  @override
  String get pagesControlWhichProductsAreAvailableInWhichChannels =>
      'تحكم في المنتجات المتاحة في أي القنوات';

  @override
  String get pagesSearchByTitleOrDescription => 'البحث حسب العنوان أو الوصف';

  @override
  String get pagesConfirmDeleteSalesChannel =>
      'هل أنت متأكد من حذف قناة المبيعات هذه؟ سيذهب الإعداد الذي قمت به إلى الأبد.';

  @override
  String get pagesDeleteChannelHeading => 'حذف القناة';

  @override
  String get pagesEditGeneralInfo => 'تعديل المعلومات العامة';

  @override
  String get pagesAddProducts => 'إضافة منتجات';

  @override
  String get pagesDeleteChannel => 'حذف القناة';

  @override
  String get pagesDisabled => 'معطل';

  @override
  String get pagesEnabled => 'مفعل';

  @override
  String get tablesCollection => 'المجموعة';

  @override
  String get tablesStartBuildingYourChannelsSetup =>
      'ابدأ في بناء إعداد القنوات الخاص بك...';

  @override
  String get tablesNoProductsInChannels =>
      'لم تقم بإضافة أي منتجات إلى هذه القنوات بعد ، ولكن ما إن تقوم بالإضافة ستعيش هنا.';

  @override
  String get tablesAddProducts => 'إضافة منتجات';

  @override
  String get tablesDetails => 'التفاصيل';

  @override
  String get tablesRemoveFromTheChannel => 'إزالة من القناة';

  @override
  String get tablesProducts => 'المنتجات';

  @override
  String salesChannelsTablePlaceholderSelectedWithCountsOne(String count) {
    return '$count';
  }

  @override
  String salesChannelsTablePlaceholderSelectedWithCountsOther(String count) {
    return '$count';
  }

  @override
  String get tablesRemove => 'إزالة';

  @override
  String get componentsSuccessfullyUpdatedCurrency => 'تم تحديث العملة بنجاح';

  @override
  String get componentsDefault => 'افتراضي';

  @override
  String get defaultStoreCurrencySuccess => 'نجاح';

  @override
  String get defaultStoreCurrencySuccessfullyUpdatedDefaultCurrency =>
      'تم تحديث العملة الافتراضية بنجاح';

  @override
  String get defaultStoreCurrencyError => 'حدث خطأ';

  @override
  String get defaultStoreCurrencyDefaultStoreCurrency =>
      'العملة الافتراضية للمتجر';

  @override
  String get defaultStoreCurrencyThisIsTheCurrencyYourPricesAreShownIn =>
      'هذه هي العملة التي تظهر بها أسعارك.';

  @override
  String get storeCurrenciesSuccess => 'نجاح';

  @override
  String get storeCurrenciesSuccessfullyUpdatedCurrencies =>
      'تم تحديث العملات بنجاح';

  @override
  String get storeCurrenciesError => 'حدث خطأ';

  @override
  String get storeCurrenciesCancel => 'إلغاء';

  @override
  String get storeCurrenciesSaveAndGoBack => 'حفظ والعودة';

  @override
  String get storeCurrenciesSaveAndClose => 'حفظ وإغلاق';

  @override
  String get storeCurrenciesAddStoreCurrencies => 'إضافة عملات للمتجر';

  @override
  String get storeCurrenciesCurrentStoreCurrencies => 'عملات المتجر الحالية';

  @override
  String get storeCurrenciesClose => 'إغلاق';

  @override
  String currentCurrenciesScreenSelectedWithCountOne(String count) {
    return '$count';
  }

  @override
  String currentCurrenciesScreenSelectedWithCountOther(String count) {
    return '$count';
  }

  @override
  String get storeCurrenciesDeselect => 'إلغاء التحديد';

  @override
  String get storeCurrenciesRemove => 'إزالة';

  @override
  String get storeCurrenciesAddCurrencies => 'إضافة عملات';

  @override
  String get storeCurrenciesStoreCurrencies => 'عملات المتجر';

  @override
  String get storeCurrenciesAllTheCurrenciesAvailableInYourStore =>
      'جميع العملات المتاحة في متجرك.';

  @override
  String get storeCurrenciesEditCurrencies => 'تعديل العملات';

  @override
  String get currenciesAnUnknownErrorOccurred => 'حدث خطأ غير معروف';

  @override
  String get currenciesError => 'حدث خطأ';

  @override
  String get currenciesBackToSettings => 'العودة إلى الإعدادات';

  @override
  String get currenciesManageTheMarketsThatYouWillOperateWithin =>
      'أدر الأسواق التي ستعمل داخلها.';

  @override
  String get currenciesIncludeOrExcludeTaxes =>
      'اختر إذا كنت تريد تضمين أو استبعاد الضرائب عند تحديد السعر بهذه العملة';

  @override
  String get currenciesTaxInclPrices => 'الأسعار شاملة الضرائب';

  @override
  String get settingsError => 'حدث خطأ';

  @override
  String get settingsMalformedSwapUrl => 'عنوان الصفحة للمبادلة تالف';

  @override
  String get settingsMalformedPaymentUrl => 'عنوان الصفحة للدفع تالف';

  @override
  String get settingsMalformedInviteUrl => 'عنوان الصفحة للدعوة تالف';

  @override
  String get settingsSuccess => 'نجاح';

  @override
  String get settingsSuccessfullyUpdatedStore => 'تم تحديث المتجر بنجاح';

  @override
  String get settingsBackToSettings => 'العودة إلى الإعدادات';

  @override
  String get settingsSave => 'حفظ';

  @override
  String get settingsCancel => 'إلغاء';

  @override
  String get settingsStoreDetails => 'تفاصيل المتجر';

  @override
  String get settingsManageYourBusinessDetails => 'أدر تفاصيل عملك';

  @override
  String get settingsGeneral => 'عام';

  @override
  String get settingsStoreName => 'اسم المتجر';

  @override
  String get settingsMedusaStore => 'متجر Medusa';

  @override
  String get settingsAdvancedSettings => 'الإعدادات المتقدمة';

  @override
  String get settingsSwapLinkTemplate => 'قالب رابط المبادلة';

  @override
  String get settingsDraftOrderLinkTemplate => 'قالب رابط مسودة الطلب';

  @override
  String get settingsInviteLinkTemplate => 'قالب رابط الدعوة';

  @override
  String get settingsManageTheGeneralSettingsForYourStore =>
      'أدر الإعدادات العامة لمتجرك';

  @override
  String get settingsManageTheSettingsForYourStoreAposSExtensions =>
      'أدر إعدادات امتدادات متجرك';

  @override
  String get editUserInformationSuccess => 'نجاح';

  @override
  String get editUserInformationYourInformationWasSuccessfullyUpdated =>
      'تم تحديث معلوماتك بنجاح';

  @override
  String get editUserInformationEditInformation => 'تعديل المعلومات';

  @override
  String get editUserInformationCancel => 'إلغاء';

  @override
  String get editUserInformationSubmitAndClose => 'إرسال وإغلاق';

  @override
  String get personalInformationBackToSettings => 'العودة إلى الإعدادات';

  @override
  String get personalInformationPersonalInformation => 'المعلومات الشخصية';

  @override
  String get personalInformationManageYourMedusaProfile =>
      'أدر ملفك الشخصي في Medusa';

  @override
  String get personalInformationLanguageSettingsTitle => 'اللغة';

  @override
  String get personalInformationLanguageSettingsDescription =>
      'عدِّل لغة Medusa Admin';

  @override
  String get personalInformationLanguageSettingsHelpUsTranslate =>
      'ساعدنا في الترجمة';

  @override
  String get personalInformationUsageInsightsTitle => 'معلومات الاستخدام';

  @override
  String get usageInsightsDisabled => 'معطل';

  @override
  String get usageInsightsActive => 'نشط';

  @override
  String get usageInsightsShareUsageInsightsAndHelpUsImproveMedusa =>
      'شارك معلومات الاستخدام وساعدنا على تحسين Medusa';

  @override
  String get usageInsightsEditPreferences => 'تعديل التفضيلات';

  @override
  String get usageInsightsSuccess => 'نجاح';

  @override
  String get usageInsightsYourInformationWasSuccessfullyUpdated =>
      'تم تحديث معلوماتك بنجاح';

  @override
  String get usageInsightsError => 'حدث خطأ';

  @override
  String get usageInsightsCancel => 'إلغاء';

  @override
  String get usageInsightsSubmitAndClose => 'إرسال وإغلاق';

  @override
  String get regionFormTitle => 'العنوان';

  @override
  String get regionFormEurope => 'أوروبا';

  @override
  String get regionFormCurrencyCodeIsRequired => 'رمز العملة مطلوب';

  @override
  String get regionFormCurrency => 'العملة';

  @override
  String get regionFormChooseCurrency => 'اختر العملة';

  @override
  String get regionFormDefaultTaxRate => 'معدل الضريبة الافتراضي';

  @override
  String get regionFormTaxRateIsRequired => 'معدل الضريبة مطلوب';

  @override
  String get regionFormTaxRateMustBeEqualToOrLessThan100 =>
      'يجب أن يساوي معدل الضريبة أو يقل عن 100٪';

  @override
  String get regionFormDefaultTaxCode => 'رمز الضريبة الافتراضي';

  @override
  String get regionFormCountries => 'الدول';

  @override
  String get regionFormChooseCountries => 'اختر الدول';

  @override
  String get regionFormTaxInclusivePrices => 'الأسعار شاملة الضرائب';

  @override
  String get regionFormWhenEnabledRegionPricesWillBeTaxInclusive =>
      'عند التمكين ، ستشمل أسعار المنطقة الضريبة.';

  @override
  String get regionFormPaymentProvidersAreRequired => 'مزودو الدفع مطلوبون';

  @override
  String get regionFormPaymentProviders => 'مزودو الدفع';

  @override
  String get regionFormChoosePaymentProviders => 'اختر مزودي الدفع...';

  @override
  String get regionFormFulfillmentProvidersAreRequired =>
      'مزودو التنفيذ مطلوبون';

  @override
  String get regionFormFulfillmentProviders => 'مزودو التنفيذ';

  @override
  String get regionFormChooseFulfillmentProviders => 'اختر مزودي التنفيذ...';

  @override
  String get shippingOptionCardSuccess => 'نجاح';

  @override
  String get shippingOptionCardShippingOptionUpdated => 'تم تحديث خيار الشحن';

  @override
  String get shippingOptionCardError => 'حدث خطأ';

  @override
  String get shippingOptionCardEditShippingOption => 'تعديل خيار الشحن';

  @override
  String get shippingOptionCardFulfillmentMethod => 'طريقة التنفيذ';

  @override
  String get shippingOptionCardCancel => 'إلغاء';

  @override
  String get shippingOptionCardSaveAndClose => 'حفظ وإغلاق';

  @override
  String get shippingOptionCardShippingOptionHasBeenDeleted =>
      'تم حذف خيار الشحن';

  @override
  String get shippingOptionCardFlatRate => 'سعر ثابت';

  @override
  String get shippingOptionCardCalcualted => 'محسوب';

  @override
  String get shippingOptionCardMinSubtotal => 'الحد الأدنى للمجموع الفرعي:';

  @override
  String get shippingOptionCardMaxSubtotal => 'الحد الأقصى للمجموع الفرعي:';

  @override
  String get shippingOptionCardAdmin => 'المشرف';

  @override
  String get shippingOptionCardStore => 'المتجر';

  @override
  String get shippingOptionCardEdit => 'تعديل';

  @override
  String get shippingOptionCardDelete => 'حذف';

  @override
  String get shippingOptionFormVisibleInStore => 'مرئي في المتجر';

  @override
  String
      get shippingOptionFormEnableOrDisableTheShippingOptionVisiblityInStore =>
          'تمكين أو تعطيل رؤية خيار الشحن في المتجر.';

  @override
  String get shippingOptionFormDetails => 'التفاصيل';

  @override
  String get shippingOptionFormTitle => 'العنوان';

  @override
  String get shippingOptionFormTitleIsRequired => 'العنوان مطلوب';

  @override
  String get shippingOptionFormPriceType => 'نوع السعر';

  @override
  String get shippingOptionFormFlatRate => 'سعر ثابت';

  @override
  String get shippingOptionFormCalculated => 'محسوب';

  @override
  String get shippingOptionFormChooseAPriceType => 'اختر نوع السعر';

  @override
  String get shippingOptionFormPrice => 'السعر';

  @override
  String get shippingOptionFormShippingProfile => 'ملف الشحن';

  @override
  String get shippingOptionFormChooseAShippingProfile => 'اختر ملف الشحن';

  @override
  String get shippingOptionFormFulfillmentMethod => 'طريقة التنفيذ';

  @override
  String get shippingOptionFormChooseAFulfillmentMethod => 'اختر طريقة التنفيذ';

  @override
  String get shippingOptionFormRequirements => 'المتطلبات';

  @override
  String get shippingOptionFormMinSubtotalMustBeLessThanMaxSubtotal =>
      'يجب أن يقل الحد الأدنى للمجموع الفرعي عن الحد الأقصى للمجموع الفرعي';

  @override
  String get shippingOptionFormMinSubtotal => 'الحد الأدنى للمجموع الفرعي';

  @override
  String get shippingOptionFormMaxSubtotal => 'الحد الأقصى للمجموع الفرعي';

  @override
  String get shippingOptionFormMetadata => 'البيانات الوصفية';

  @override
  String get generalSectionSuccess => 'نجاح';

  @override
  String get generalSectionRegionWasSuccessfullyUpdated =>
      'تم تحديث المنطقة بنجاح';

  @override
  String get generalSectionError => 'حدث خطأ';

  @override
  String get generalSectionEditRegionDetails => 'تعديل تفاصيل المنطقة';

  @override
  String get generalSectionDetails => 'التفاصيل';

  @override
  String get generalSectionProviders => 'المزودون';

  @override
  String get generalSectionMetadata => 'البيانات الوصفية';

  @override
  String get generalSectionCancel => 'إلغاء';

  @override
  String get generalSectionSaveAndClose => 'حفظ وإغلاق';

  @override
  String get editSomethingWentWrong => 'حدث خطأ ما...';

  @override
  String get editNoRegionFound =>
      'لا يمكننا العثور على منطقة بهذا المعرف، استخدم القائمة على اليسار لتحديد منطقة.';

  @override
  String get returnShippingOptionsSuccess => 'نجاح';

  @override
  String get returnShippingOptionsShippingOptionCreated =>
      'تم إنشاء خيار الشحن';

  @override
  String get returnShippingOptionsError => 'حدث خطأ';

  @override
  String get returnShippingOptionsAddReturnShippingOption =>
      'إضافة خيار شحن إرجاع';

  @override
  String get returnShippingOptionsCancel => 'إلغاء';

  @override
  String get returnShippingOptionsSaveAndClose => 'حفظ وإغلاق';

  @override
  String get returnShippingOptionsReturnShippingOptions => 'خيارات شحن الإرجاع';

  @override
  String get returnShippingOptionsAddOption => 'إضافة خيار';

  @override
  String
      get returnShippingOptionsEnterSpecificsAboutAvailableRegionalReturnShipmentMethods =>
          'أدخل تفاصيل حول طرق شحن الإرجاع الإقليمية المتاحة.';

  @override
  String get shippingOptionsSuccess => 'نجاح';

  @override
  String get shippingOptionsShippingOptionCreated => 'تم إنشاء خيار الشحن';

  @override
  String get shippingOptionsError => 'حدث خطأ';

  @override
  String get shippingOptionsAddShippingOption => 'إضافة خيار شحن';

  @override
  String get shippingOptionsCancel => 'إلغاء';

  @override
  String get shippingOptionsSaveAndClose => 'حفظ وإغلاق';

  @override
  String get shippingOptionsShippingOptions => 'خيارات الشحن';

  @override
  String get shippingOptionsAddOption => 'إضافة خيار';

  @override
  String
      get shippingOptionsEnterSpecificsAboutAvailableRegionalShipmentMethods =>
          'أدخل تفاصيل حول طرق الشحن الإقليمية المتاحة.';

  @override
  String get newRegionCreated => 'تم إنشاء المنطقة';

  @override
  String get newCreateRegion => 'إنشاء منطقة';

  @override
  String get newDetails => 'التفاصيل';

  @override
  String get newAddTheRegionDetails => 'أضف تفاصيل المنطقة.';

  @override
  String get newProviders => 'المزودون';

  @override
  String
      get newAddWhichFulfillmentAndPaymentProvidersShouldBeAvailableInThisRegion =>
          'أضف مزودي التنفيذ والدفع الذين يجب أن يكونوا متاحين في هذه المنطقة.';

  @override
  String get regionOverviewRegions => 'المناطق';

  @override
  String get regionOverviewManageTheMarketsThatYouWillOperateWithin =>
      'أدر الأسواق التي ستعمل داخلها.';

  @override
  String get regionOverviewNotConfigured => 'غير مهيأ';

  @override
  String get regionOverviewFulfillmentProviders => 'مزودو التنفيذ:';

  @override
  String get returnReasonsNotificationSuccess => 'نجاح';

  @override
  String get returnReasonsCreatedANewReturnReason => 'تم إنشاء سبب إرجاع جديد';

  @override
  String get returnReasonsSuccess => 'نجاح';

  @override
  String get returnReasonsError => 'حدث خطأ';

  @override
  String get returnReasonsCannotCreateAReturnReasonWithAnExistingValue =>
      'لا يمكن إنشاء سبب إرجاع بقيمة موجودة';

  @override
  String get returnReasonsAddReason => 'إضافة سبب';

  @override
  String get returnReasonsValueIsRequired => 'القيمة مطلوبة';

  @override
  String get returnReasonsValue => 'القيمة';

  @override
  String get returnReasonsLabelIsRequired => 'التسمية مطلوبة';

  @override
  String get returnReasonsLabel => 'التسمية';

  @override
  String get returnReasonsDescription => 'الوصف';

  @override
  String get returnReasonsCustomerReceivedTheWrongSize =>
      'تلقى العميل المقاس الخطأ';

  @override
  String get returnReasonsCancel => 'إلغاء';

  @override
  String get returnReasonsCreate => 'إنشاء';

  @override
  String get returnReasonsSuccessTitle => 'نجاح';

  @override
  String get returnReasonsSuccessfullyUpdatedReturnReason =>
      'تم تحديث سبب الإرجاع بنجاح';

  @override
  String get returnReasonsDuplicateReason => 'سبب مكرر';

  @override
  String get returnReasonsDeleteReason => 'حذف السبب';

  @override
  String get returnReasonsSave => 'حفظ';

  @override
  String get returnReasonsDetails => 'التفاصيل';

  @override
  String get returnReasonsDeleteReturnReason => 'حذف سبب الإرجاع';

  @override
  String get returnReasonsAreYouSureYouWantToDeleteThisReturnReason =>
      'هل أنت متأكد أنك تريد حذف هذا السبب؟';

  @override
  String get returnReasonsBackToSettings => 'العودة إلى الإعدادات';

  @override
  String get returnReasonsReturnReasons => 'أسباب الإرجاع';

  @override
  String get returnReasonsAddReasonLabel => 'إضافة سبب';

  @override
  String get returnReasonsManageReasonsForReturnedItems =>
      'أدِر أسباب إرجاع العناصر';

  @override
  String get taxesDetails => 'التفاصيل';

  @override
  String get taxesNewTaxRate => 'معدل ضريبة جديد';

  @override
  String get taxesTaxCalculationSettings => 'إعدادات حساب الضريبة';

  @override
  String get taxesSuccess => 'نجاح';

  @override
  String get taxesSuccessfullyUpdatedTaxRate => 'تم تحديث معدل الضريبة بنجاح.';

  @override
  String get taxesError => 'حدث خطأ';

  @override
  String get taxesOverrides => 'التجاوزات';

  @override
  String get taxesProductRules => 'قواعد المنتج';

  @override
  String taxesProductRulesDescriptionOne(String count) {
    return 'ينطبق على $count منتج';
  }

  @override
  String taxesProductRulesDescriptionOther(String count) {
    return 'ينطبق على $count منتج';
  }

  @override
  String get taxesProductTypeRules => 'قواعد نوع المنتج';

  @override
  String taxesProductTypeRulesDescriptionOne(String count) {
    return 'ينطبق على $count نوع منتج';
  }

  @override
  String taxesProductTypeRulesDescriptionOther(String count) {
    return 'ينطبق على $count نوع منتج';
  }

  @override
  String get taxesShippingOptionRules => 'قواعد خيار الشحن';

  @override
  String taxesAppliesToShippingOptionWithCountOne(String count) {
    return 'ينطبق على $count خيار شحن';
  }

  @override
  String taxesAppliesToShippingOptionWithCountOther(String count) {
    return 'ينطبق على $count خيار شحن';
  }

  @override
  String get taxesAddOverrides => 'إضافة تجاوزات';

  @override
  String get taxesCancel => 'إلغاء';

  @override
  String get taxesSave => 'حفظ';

  @override
  String get taxesName => 'الاسم';

  @override
  String get taxesDefault => 'افتراضي';

  @override
  String get taxesRateName => 'اسم المعدل';

  @override
  String get taxesTaxRate => 'معدل الضريبة';

  @override
  String get taxesTaxCode => 'رمز الضريبة';

  @override
  String get taxesEditTaxRate => 'تحرير معدل الضريبة';

  @override
  String get taxesBackToSettings => 'العودة إلى الإعدادات';

  @override
  String get taxesRegions => 'المناطق';

  @override
  String get taxesSelectTheRegionYouWishToManageTaxesFor =>
      'حدد المنطقة التي ترغب في إدارة الضرائب لها';

  @override
  String get taxesGoToRegionSettings => 'الذهاب إلى إعدادات المنطقة';

  @override
  String get taxesSuccessfullyCreatedTaxRate => 'تم إنشاء معدل ضريبة بنجاح.';

  @override
  String get taxesAddTaxRate => 'إضافة معدل ضريبة';

  @override
  String taxesAppliesToProductTypeWithCountOne(String count) {
    return 'ينطبق على $count نوع منتج';
  }

  @override
  String taxesAppliesToProductTypeWithCountOther(String count) {
    return 'ينطبق على $count نوع منتج';
  }

  @override
  String get taxesCreate => 'إنشاء';

  @override
  String get taxesSelectProducts => 'تحديد المنتجات';

  @override
  String get taxesSelectProductTypesLabel => 'تحديد أنواع المنتجات';

  @override
  String get taxesProductTypes => 'أنواع المنتجات';

  @override
  String get taxesSystemTaxProvider => 'مزود ضريبة النظام';

  @override
  String get taxesRegionTaxSettingsWereSuccessfullyUpdated =>
      'تم تحديث إعدادات ضريبة المنطقة بنجاح';

  @override
  String get taxesTaxProvider => 'مزود الضريبة';

  @override
  String get taxesCalculateTaxesAutomatically => 'حساب الضرائب تلقائياً؟';

  @override
  String get taxesAutomaticallyApplyTaxCalculationsToCarts =>
      'عند التحقق سيقوم Medusa تلقائيًا بتطبيق حسابات الضريبة على عربات التسوق في هذه المنطقة. عند عدم التحقق ، سيتعين عليك حساب الضرائب يدويًا عند الخروج. توصى الضرائب اليدوية إذا كنت تستخدم مزود ضريبة خارجي لتجنب تنفيذ الكثير من الطلبات';

  @override
  String get taxesApplyTaxToGiftCards => 'تطبيق الضريبة على بطاقات الهدايا؟';

  @override
  String get taxesApplyTaxesToGiftCards =>
      'عند التحقق ، سيتم تطبيق الضرائب على بطاقات الهدايا عند الخروج. في بعض البلدان ، تتطلب لوائح الضريبة تطبيق الضرائب على بطاقات الهدايا عند الشراء.';

  @override
  String get taxesSearchProducts => 'البحث عن منتجات..';

  @override
  String get taxesSelectShippingOption => 'حدد خيار الشحن';

  @override
  String get taxesShippingOptions => 'خيارات الشحن';

  @override
  String get taxesDeleteTaxRateHeading => 'حذف معدل الضريبة';

  @override
  String get taxesConfirmDelete =>
      'هل أنت متأكد أنك تريد حذف معدل الضريبة هذا؟';

  @override
  String get taxesTaxRateWasDeleted => 'تم حذف معدل الضريبة.';

  @override
  String get taxesEdit => 'تعديل';

  @override
  String get taxesDeleteTaxRate => 'حذف معدل الضريبة';

  @override
  String get taxesDeleteRule => 'حذف القاعدة';

  @override
  String get taxesType => 'النوع';

  @override
  String get taxesProducts => 'المنتجات';

  @override
  String get taxesSelectIndividualProducts => 'تحديد منتجات محددة';

  @override
  String get taxesSelectProductTypes => 'تحديد أنواع المنتجات';

  @override
  String get taxesSelectShippingOptions => 'تحديد خيارات الشحن';

  @override
  String get taxesBack => 'العودة';

  @override
  String get taxesAdd => 'إضافة';

  @override
  String get taxesCode => 'الرمز';

  @override
  String get usersInviteUsers => 'دعوة مستخدمين';

  @override
  String get usersBackToSettings => 'العودة إلى الإعدادات';

  @override
  String get usersTheTeam => 'الفريق';

  @override
  String get usersManageUsersOfYourMedusaStore =>
      'أدِر مستخدمي متجر Medusa الخاص بك';

  @override
  String usersCountOne(String count) {
    return '$count';
  }

  @override
  String usersCountOther(String count) {
    return '$count';
  }
}
