import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @backButtonGoBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get backButtonGoBack;

  /// No description provided for @filterMenuTrigger.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get filterMenuTrigger;

  /// No description provided for @filterMenuClearButton.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get filterMenuClearButton;

  /// No description provided for @filterMenuSelectItemDefaultPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Select filter'**
  String get filterMenuSelectItemDefaultPlaceholder;

  /// No description provided for @filterMenuSelectItemClearButton.
  ///
  /// In en, this message translates to:
  /// **'Clear the selected options'**
  String get filterMenuSelectItemClearButton;

  /// No description provided for @filterMenuSelectItemSelected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get filterMenuSelectItemSelected;

  /// No description provided for @filterMenuDateItemBefore.
  ///
  /// In en, this message translates to:
  /// **'Before'**
  String get filterMenuDateItemBefore;

  /// No description provided for @filterMenuDateItemAfter.
  ///
  /// In en, this message translates to:
  /// **'After'**
  String get filterMenuDateItemAfter;

  /// No description provided for @filterMenuDateItemBetween.
  ///
  /// In en, this message translates to:
  /// **'Between'**
  String get filterMenuDateItemBetween;

  /// No description provided for @salesChannelsDisplayAvailableCount.
  ///
  /// In en, this message translates to:
  /// **'Available in {availableChannelsCount} out of {totalChannelsCount} Sales Channels'**
  String salesChannelsDisplayAvailableCount(
      String availableChannelsCount, String totalChannelsCount);

  /// No description provided for @activityDrawerActivity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activityDrawerActivity;

  /// No description provided for @activityDrawerNoNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'It\'s quiet in here...'**
  String get activityDrawerNoNotificationsTitle;

  /// No description provided for @activityDrawerNoNotificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any notifications at the moment, but once you do they will live here.'**
  String get activityDrawerNoNotificationsDescription;

  /// No description provided for @activityDrawerErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Oh no...'**
  String get activityDrawerErrorTitle;

  /// No description provided for @activityDrawerErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while trying to fetch your notifications - We will keep trying!'**
  String get activityDrawerErrorDescription;

  /// No description provided for @activityDrawerProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get activityDrawerProcessing;

  /// No description provided for @analyticsConfigFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Anonymize my usage data'**
  String get analyticsConfigFormTitle;

  /// No description provided for @analyticsConfigFormDescription.
  ///
  /// In en, this message translates to:
  /// **'You can choose to anonymize your usage data. If this option is selected, we will not collect your personal information, such as your name and email address.'**
  String get analyticsConfigFormDescription;

  /// No description provided for @analyticsConfigFormOptOut.
  ///
  /// In en, this message translates to:
  /// **'Opt out of sharing my usage data'**
  String get analyticsConfigFormOptOut;

  /// No description provided for @analyticsConfigFormOptOutLater.
  ///
  /// In en, this message translates to:
  /// **'You can always opt out of sharing your usage data at any time.'**
  String get analyticsConfigFormOptOutLater;

  /// No description provided for @analyticsPreferencesSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get analyticsPreferencesSuccess;

  /// No description provided for @analyticsPreferencesYourPreferencesWereSuccessfullyUpdated.
  ///
  /// In en, this message translates to:
  /// **'Your preferences were successfully updated'**
  String get analyticsPreferencesYourPreferencesWereSuccessfullyUpdated;

  /// No description provided for @analyticsPreferencesError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get analyticsPreferencesError;

  /// No description provided for @analyticsPreferencesHelpUsGetBetter.
  ///
  /// In en, this message translates to:
  /// **'Help us get better'**
  String get analyticsPreferencesHelpUsGetBetter;

  /// No description provided for @analyticsPreferencesDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'To create the most compelling e-commerce experience we would like to gain insights in how you use Medusa. User insights allow us to build a better, more engaging, and more usable products. We only collect data for product improvements. Read what data we gather in our'**
  String get analyticsPreferencesDisclaimer;

  /// No description provided for @analyticsPreferencesDocumentation.
  ///
  /// In en, this message translates to:
  /// **'documentation'**
  String get analyticsPreferencesDocumentation;

  /// No description provided for @analyticsPreferencesPleaseEnterAValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get analyticsPreferencesPleaseEnterAValidEmail;

  /// No description provided for @analyticsPreferencesContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get analyticsPreferencesContinue;

  /// No description provided for @currencyInputCurrency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currencyInputCurrency;

  /// No description provided for @currencyInputAmountIsNotValid.
  ///
  /// In en, this message translates to:
  /// **'Amount is not valid'**
  String get currencyInputAmountIsNotValid;

  /// No description provided for @organismsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get organismsSuccess;

  /// No description provided for @organismsDeleteSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Delete successful'**
  String get organismsDeleteSuccessful;

  /// No description provided for @organismsAreYouSureYouWantToDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete?'**
  String get organismsAreYouSureYouWantToDelete;

  /// No description provided for @organismsNoCancel.
  ///
  /// In en, this message translates to:
  /// **'No, cancel'**
  String get organismsNoCancel;

  /// No description provided for @organismsYesRemove.
  ///
  /// In en, this message translates to:
  /// **'Yes, remove'**
  String get organismsYesRemove;

  /// No description provided for @detailsCollapsibleHideAdditionalDetails.
  ///
  /// In en, this message translates to:
  /// **'Hide additional details'**
  String get detailsCollapsibleHideAdditionalDetails;

  /// No description provided for @detailsCollapsibleShowAdditionalDetails.
  ///
  /// In en, this message translates to:
  /// **'Show additional details'**
  String get detailsCollapsibleShowAdditionalDetails;

  /// No description provided for @editUserModalSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get editUserModalSuccess;

  /// No description provided for @editUserModalUserWasUpdated.
  ///
  /// In en, this message translates to:
  /// **'User was updated'**
  String get editUserModalUserWasUpdated;

  /// No description provided for @editUserModalError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get editUserModalError;

  /// No description provided for @editUserModalEditUser.
  ///
  /// In en, this message translates to:
  /// **'Edit User'**
  String get editUserModalEditUser;

  /// No description provided for @editUserModalFirstNameLabel.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get editUserModalFirstNameLabel;

  /// No description provided for @editUserModalFirstNamePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'First name...'**
  String get editUserModalFirstNamePlaceholder;

  /// No description provided for @editUserModalLastNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get editUserModalLastNameLabel;

  /// No description provided for @editUserModalLastNamePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Last name...'**
  String get editUserModalLastNamePlaceholder;

  /// No description provided for @editUserModalEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get editUserModalEmail;

  /// No description provided for @editUserModalCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get editUserModalCancel;

  /// No description provided for @editUserModalSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get editUserModalSave;

  /// No description provided for @errorBoundaryBackToDashboard.
  ///
  /// In en, this message translates to:
  /// **'Back to dashboard'**
  String get errorBoundaryBackToDashboard;

  /// No description provided for @errorBoundaryAnUnknownErrorOccured.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occured'**
  String get errorBoundaryAnUnknownErrorOccured;

  /// No description provided for @errorBoundaryBadRequest.
  ///
  /// In en, this message translates to:
  /// **'Bad request'**
  String get errorBoundaryBadRequest;

  /// No description provided for @errorBoundaryYouAreNotLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'You are not logged in'**
  String get errorBoundaryYouAreNotLoggedIn;

  /// No description provided for @errorBoundaryYouDoNotHavePermissionPerformThisAction.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to perform this action'**
  String get errorBoundaryYouDoNotHavePermissionPerformThisAction;

  /// No description provided for @errorBoundaryPageWasNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page was not found'**
  String get errorBoundaryPageWasNotFound;

  /// No description provided for @errorBoundaryAnUnknownServerErrorOccured.
  ///
  /// In en, this message translates to:
  /// **'An unknown server error occured'**
  String get errorBoundaryAnUnknownServerErrorOccured;

  /// No description provided for @errorBoundary503.
  ///
  /// In en, this message translates to:
  /// **'Server is currently unavailable'**
  String get errorBoundary503;

  /// No description provided for @errorBoundary500.
  ///
  /// In en, this message translates to:
  /// **'An error occurred with unspecified causes, this is most likely due to a techinical issue on our end. Please try refreshing the page. If the issue keeps happening, contact your administrator.'**
  String get errorBoundary500;

  /// No description provided for @errorBoundary400.
  ///
  /// In en, this message translates to:
  /// **'The request was malformed, fix your request and please try again.'**
  String get errorBoundary400;

  /// No description provided for @errorBoundary401.
  ///
  /// In en, this message translates to:
  /// **'You are not logged in, please log in to proceed.'**
  String get errorBoundary401;

  /// No description provided for @errorBoundary403.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to perform this action, if you think this is a mistake, contact your administrator.'**
  String get errorBoundary403;

  /// No description provided for @errorBoundary404.
  ///
  /// In en, this message translates to:
  /// **'The page you have requested was not found, please check the URL and try again.'**
  String get errorBoundary404;

  /// No description provided for @errorBoundary5002.
  ///
  /// In en, this message translates to:
  /// **'The server was not able to handle your request, this is mostly likely due to a techinical issue on our end. Please try again. If the issue keeps happening, contact your administrator.'**
  String get errorBoundary5002;

  /// No description provided for @errorBoundary5032.
  ///
  /// In en, this message translates to:
  /// **'The server is temporarily unavailable, and your request could not be processed. Please try again later. If the issue keeps happening, contact your administrator.'**
  String get errorBoundary5032;

  /// No description provided for @exportModalTitle.
  ///
  /// In en, this message translates to:
  /// **'Initialize an export of your data'**
  String get exportModalTitle;

  /// No description provided for @exportModalCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get exportModalCancel;

  /// No description provided for @exportModalExport.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get exportModalExport;

  /// No description provided for @fileUploadModalUploadANewPhoto.
  ///
  /// In en, this message translates to:
  /// **'Upload a new photo'**
  String get fileUploadModalUploadANewPhoto;

  /// No description provided for @giftCardBannerEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get giftCardBannerEdit;

  /// No description provided for @giftCardBannerUnpublish.
  ///
  /// In en, this message translates to:
  /// **'Unpublish'**
  String get giftCardBannerUnpublish;

  /// No description provided for @giftCardBannerPublish.
  ///
  /// In en, this message translates to:
  /// **'Publish'**
  String get giftCardBannerPublish;

  /// No description provided for @giftCardBannerDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get giftCardBannerDelete;

  /// No description provided for @giftCardBannerPublished.
  ///
  /// In en, this message translates to:
  /// **'Published'**
  String get giftCardBannerPublished;

  /// No description provided for @giftCardBannerUnpublished.
  ///
  /// In en, this message translates to:
  /// **'Unpublished'**
  String get giftCardBannerUnpublished;

  /// No description provided for @giftCardDenominationsSectionDenominationAdded.
  ///
  /// In en, this message translates to:
  /// **'Denomination added'**
  String get giftCardDenominationsSectionDenominationAdded;

  /// No description provided for @giftCardDenominationsSectionANewDenominationWasSuccessfullyAdded.
  ///
  /// In en, this message translates to:
  /// **'A new denomination was successfully added'**
  String get giftCardDenominationsSectionANewDenominationWasSuccessfullyAdded;

  /// No description provided for @giftCardDenominationsSectionADenominationWithThatDefaultValueAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'A denomination with that default value already exists'**
  String
      get giftCardDenominationsSectionADenominationWithThatDefaultValueAlreadyExists;

  /// No description provided for @giftCardDenominationsSectionError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get giftCardDenominationsSectionError;

  /// No description provided for @giftCardDenominationsSectionAddDenomination.
  ///
  /// In en, this message translates to:
  /// **'Add Denomination'**
  String get giftCardDenominationsSectionAddDenomination;

  /// No description provided for @giftCardDenominationsSectionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get giftCardDenominationsSectionCancel;

  /// No description provided for @giftCardDenominationsSectionSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get giftCardDenominationsSectionSaveAndClose;

  /// No description provided for @giftCardDenominationsSectionDenominationUpdated.
  ///
  /// In en, this message translates to:
  /// **'Denomination updated'**
  String get giftCardDenominationsSectionDenominationUpdated;

  /// No description provided for @giftCardDenominationsSectionANewDenominationWasSuccessfullyUpdated.
  ///
  /// In en, this message translates to:
  /// **'A new denomination was successfully updated'**
  String get giftCardDenominationsSectionANewDenominationWasSuccessfullyUpdated;

  /// No description provided for @giftCardDenominationsSectionEditDenomination.
  ///
  /// In en, this message translates to:
  /// **'Edit Denomination'**
  String get giftCardDenominationsSectionEditDenomination;

  /// No description provided for @giftCardDenominationsSectionDenominations.
  ///
  /// In en, this message translates to:
  /// **'Denominations'**
  String get giftCardDenominationsSectionDenominations;

  /// No description provided for @giftCardDenominationsSectionDenomination.
  ///
  /// In en, this message translates to:
  /// **'Denomination'**
  String get giftCardDenominationsSectionDenomination;

  /// No description provided for @giftCardDenominationsSectionInOtherCurrencies.
  ///
  /// In en, this message translates to:
  /// **'In other currencies'**
  String get giftCardDenominationsSectionInOtherCurrencies;

  /// No description provided for @giftCardDenominationsSectionAndMoreOne.
  ///
  /// In en, this message translates to:
  /// **', and {count} more'**
  String giftCardDenominationsSectionAndMoreOne(String count);

  /// No description provided for @giftCardDenominationsSectionAndMoreOther.
  ///
  /// In en, this message translates to:
  /// **', and {count} more'**
  String giftCardDenominationsSectionAndMoreOther(String count);

  /// No description provided for @giftCardDenominationsSectionDeleteDenomination.
  ///
  /// In en, this message translates to:
  /// **'Delete denomination'**
  String get giftCardDenominationsSectionDeleteDenomination;

  /// No description provided for @giftCardDenominationsSectionConfirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this denomination?'**
  String get giftCardDenominationsSectionConfirmDelete;

  /// No description provided for @giftCardDenominationsSectionDenominationDeleted.
  ///
  /// In en, this message translates to:
  /// **'Denomination deleted'**
  String get giftCardDenominationsSectionDenominationDeleted;

  /// No description provided for @giftCardDenominationsSectionDenominationWasSuccessfullyDeleted.
  ///
  /// In en, this message translates to:
  /// **'Denomination was successfully deleted'**
  String get giftCardDenominationsSectionDenominationWasSuccessfullyDeleted;

  /// No description provided for @giftCardDenominationsSectionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get giftCardDenominationsSectionEdit;

  /// No description provided for @giftCardDenominationsSectionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get giftCardDenominationsSectionDelete;

  /// No description provided for @helpDialogHowCanWeHelp.
  ///
  /// In en, this message translates to:
  /// **'How can we help?'**
  String get helpDialogHowCanWeHelp;

  /// No description provided for @helpDialogWeUsuallyRespondInAFewHours.
  ///
  /// In en, this message translates to:
  /// **'We usually respond in a few hours'**
  String get helpDialogWeUsuallyRespondInAFewHours;

  /// No description provided for @helpDialogSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get helpDialogSubject;

  /// No description provided for @helpDialogWhatIsItAbout.
  ///
  /// In en, this message translates to:
  /// **'What is it about?...'**
  String get helpDialogWhatIsItAbout;

  /// No description provided for @helpDialogWriteAMessage.
  ///
  /// In en, this message translates to:
  /// **'Write a message...'**
  String get helpDialogWriteAMessage;

  /// No description provided for @helpDialogFeelFreeToJoinOurCommunityOf.
  ///
  /// In en, this message translates to:
  /// **'Feel free to join our community of'**
  String get helpDialogFeelFreeToJoinOurCommunityOf;

  /// No description provided for @helpDialogMerchantsAndECommerceDevelopers.
  ///
  /// In en, this message translates to:
  /// **'merchants and e-commerce developers'**
  String get helpDialogMerchantsAndECommerceDevelopers;

  /// No description provided for @helpDialogSendAMessage.
  ///
  /// In en, this message translates to:
  /// **'Send a message'**
  String get helpDialogSendAMessage;

  /// No description provided for @inviteModalSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get inviteModalSuccess;

  /// No description provided for @inviteModalInvitationSentTo.
  ///
  /// In en, this message translates to:
  /// **'Invitation sent to {user}'**
  String inviteModalInvitationSentTo(String user);

  /// No description provided for @inviteModalError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get inviteModalError;

  /// No description provided for @inviteModalMember.
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get inviteModalMember;

  /// No description provided for @inviteModalAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get inviteModalAdmin;

  /// No description provided for @inviteModalDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get inviteModalDeveloper;

  /// No description provided for @inviteModalInviteUsers.
  ///
  /// In en, this message translates to:
  /// **'Invite Users'**
  String get inviteModalInviteUsers;

  /// No description provided for @inviteModalEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get inviteModalEmail;

  /// No description provided for @inviteModalRole.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get inviteModalRole;

  /// No description provided for @inviteModalSelectRole.
  ///
  /// In en, this message translates to:
  /// **'Select role'**
  String get inviteModalSelectRole;

  /// No description provided for @inviteModalCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get inviteModalCancel;

  /// No description provided for @inviteModalInvite.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get inviteModalInvite;

  /// No description provided for @loginCardNoMatch.
  ///
  /// In en, this message translates to:
  /// **'These credentials do not match our records.'**
  String get loginCardNoMatch;

  /// No description provided for @loginCardLogInToMedusa.
  ///
  /// In en, this message translates to:
  /// **'Log in to Medusa'**
  String get loginCardLogInToMedusa;

  /// No description provided for @loginCardEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginCardEmail;

  /// No description provided for @loginCardPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginCardPassword;

  /// No description provided for @loginCardForgotYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get loginCardForgotYourPassword;

  /// No description provided for @metadataAddMetadata.
  ///
  /// In en, this message translates to:
  /// **'Add Metadata'**
  String get metadataAddMetadata;

  /// No description provided for @productAttributesSectionEditAttributes.
  ///
  /// In en, this message translates to:
  /// **'Edit Attributes'**
  String get productAttributesSectionEditAttributes;

  /// No description provided for @productAttributesSectionDimensions.
  ///
  /// In en, this message translates to:
  /// **'Dimensions'**
  String get productAttributesSectionDimensions;

  /// No description provided for @productAttributesSectionConfigureToCalculateTheMostAccurateShippingRates.
  ///
  /// In en, this message translates to:
  /// **'Configure to calculate the most accurate shipping rates'**
  String
      get productAttributesSectionConfigureToCalculateTheMostAccurateShippingRates;

  /// No description provided for @productAttributesSectionCustoms.
  ///
  /// In en, this message translates to:
  /// **'Customs'**
  String get productAttributesSectionCustoms;

  /// No description provided for @productAttributesSectionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get productAttributesSectionCancel;

  /// No description provided for @productAttributesSectionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get productAttributesSectionSave;

  /// No description provided for @productAttributesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Attributes'**
  String get productAttributesSectionTitle;

  /// No description provided for @productAttributesSectionHeight.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get productAttributesSectionHeight;

  /// No description provided for @productAttributesSectionWidth.
  ///
  /// In en, this message translates to:
  /// **'Width'**
  String get productAttributesSectionWidth;

  /// No description provided for @productAttributesSectionLength.
  ///
  /// In en, this message translates to:
  /// **'Length'**
  String get productAttributesSectionLength;

  /// No description provided for @productAttributesSectionWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get productAttributesSectionWeight;

  /// No description provided for @productAttributesSectionMidCode.
  ///
  /// In en, this message translates to:
  /// **'MID Code'**
  String get productAttributesSectionMidCode;

  /// No description provided for @productAttributesSectionHsCode.
  ///
  /// In en, this message translates to:
  /// **'HS Code'**
  String get productAttributesSectionHsCode;

  /// No description provided for @productAttributesSectionCountryOfOrigin.
  ///
  /// In en, this message translates to:
  /// **'Country of origin'**
  String get productAttributesSectionCountryOfOrigin;

  /// No description provided for @productGeneralSectionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get productGeneralSectionSuccess;

  /// No description provided for @productGeneralSectionSuccessfullyUpdatedSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated sales channels'**
  String get productGeneralSectionSuccessfullyUpdatedSalesChannels;

  /// No description provided for @productGeneralSectionError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get productGeneralSectionError;

  /// No description provided for @productGeneralSectionFailedToUpdateSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Failed to update sales channels'**
  String get productGeneralSectionFailedToUpdateSalesChannels;

  /// No description provided for @productGeneralSectionEditGeneralInformation.
  ///
  /// In en, this message translates to:
  /// **'Edit General Information'**
  String get productGeneralSectionEditGeneralInformation;

  /// No description provided for @productGeneralSectionGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Gift Card'**
  String get productGeneralSectionGiftCard;

  /// No description provided for @productGeneralSectionProduct.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get productGeneralSectionProduct;

  /// No description provided for @productGeneralSectionMetadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get productGeneralSectionMetadata;

  /// No description provided for @productGeneralSectionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get productGeneralSectionCancel;

  /// No description provided for @productGeneralSectionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get productGeneralSectionSave;

  /// No description provided for @productGeneralSectionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get productGeneralSectionDelete;

  /// No description provided for @productGeneralSectionEditSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Edit Sales Channels'**
  String get productGeneralSectionEditSalesChannels;

  /// No description provided for @productGeneralSectionPublished.
  ///
  /// In en, this message translates to:
  /// **'Published'**
  String get productGeneralSectionPublished;

  /// No description provided for @productGeneralSectionDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get productGeneralSectionDraft;

  /// No description provided for @productGeneralSectionDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get productGeneralSectionDetails;

  /// No description provided for @productGeneralSectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Subtitle'**
  String get productGeneralSectionSubtitle;

  /// No description provided for @productGeneralSectionHandle.
  ///
  /// In en, this message translates to:
  /// **'Handle'**
  String get productGeneralSectionHandle;

  /// No description provided for @productGeneralSectionType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get productGeneralSectionType;

  /// No description provided for @productGeneralSectionCollection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get productGeneralSectionCollection;

  /// No description provided for @productGeneralSectionCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get productGeneralSectionCategory;

  /// No description provided for @productGeneralSectionDiscountable.
  ///
  /// In en, this message translates to:
  /// **'Discountable'**
  String get productGeneralSectionDiscountable;

  /// No description provided for @productGeneralSectionTrue.
  ///
  /// In en, this message translates to:
  /// **'True'**
  String get productGeneralSectionTrue;

  /// No description provided for @productGeneralSectionFalse.
  ///
  /// In en, this message translates to:
  /// **'False'**
  String get productGeneralSectionFalse;

  /// No description provided for @productGeneralSectionCountOne.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String productGeneralSectionCountOne(String count);

  /// No description provided for @productGeneralSectionCountOther.
  ///
  /// In en, this message translates to:
  /// **'count'**
  String productGeneralSectionCountOther(String count);

  /// No description provided for @productGeneralSectionSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Sales channels'**
  String get productGeneralSectionSalesChannels;

  /// No description provided for @productMediaSectionEditMedia.
  ///
  /// In en, this message translates to:
  /// **'Edit Media'**
  String get productMediaSectionEditMedia;

  /// No description provided for @productMediaSectionUploadImagesError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while trying to upload images.'**
  String get productMediaSectionUploadImagesError;

  /// No description provided for @productMediaSectionFileServiceNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'You might not have a file service configured. Please contact your administrator'**
  String get productMediaSectionFileServiceNotConfigured;

  /// No description provided for @productMediaSectionError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get productMediaSectionError;

  /// No description provided for @productMediaSectionMedia.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get productMediaSectionMedia;

  /// No description provided for @productMediaSectionAddImagesToYourProduct.
  ///
  /// In en, this message translates to:
  /// **'Add images to your product.'**
  String get productMediaSectionAddImagesToYourProduct;

  /// No description provided for @productMediaSectionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get productMediaSectionCancel;

  /// No description provided for @productMediaSectionSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get productMediaSectionSaveAndClose;

  /// No description provided for @productRawSectionRawGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Raw Gift Card'**
  String get productRawSectionRawGiftCard;

  /// No description provided for @productRawSectionRawProduct.
  ///
  /// In en, this message translates to:
  /// **'Raw Product'**
  String get productRawSectionRawProduct;

  /// No description provided for @productThumbnailSectionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get productThumbnailSectionSuccess;

  /// No description provided for @productThumbnailSectionSuccessfullyDeletedThumbnail.
  ///
  /// In en, this message translates to:
  /// **'Successfully deleted thumbnail'**
  String get productThumbnailSectionSuccessfullyDeletedThumbnail;

  /// No description provided for @productThumbnailSectionError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get productThumbnailSectionError;

  /// No description provided for @productThumbnailSectionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get productThumbnailSectionEdit;

  /// No description provided for @productThumbnailSectionUpload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get productThumbnailSectionUpload;

  /// No description provided for @productThumbnailSectionUploadThumbnailError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while trying to upload the thumbnail.'**
  String get productThumbnailSectionUploadThumbnailError;

  /// No description provided for @productThumbnailSectionYouMightNotHaveAFileServiceConfiguredPleaseContactYourAdministrator.
  ///
  /// In en, this message translates to:
  /// **'You might not have a file service configured. Please contact your administrator'**
  String
      get productThumbnailSectionYouMightNotHaveAFileServiceConfiguredPleaseContactYourAdministrator;

  /// No description provided for @productThumbnailSectionUploadThumbnail.
  ///
  /// In en, this message translates to:
  /// **'Upload Thumbnail'**
  String get productThumbnailSectionUploadThumbnail;

  /// No description provided for @productThumbnailSectionThumbnail.
  ///
  /// In en, this message translates to:
  /// **'Thumbnail'**
  String get productThumbnailSectionThumbnail;

  /// No description provided for @productThumbnailSectionUsedToRepresentYourProductDuringCheckoutSocialSharingAndMore.
  ///
  /// In en, this message translates to:
  /// **'Used to represent your product during checkout, social sharing and more.'**
  String
      get productThumbnailSectionUsedToRepresentYourProductDuringCheckoutSocialSharingAndMore;

  /// No description provided for @productThumbnailSectionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get productThumbnailSectionCancel;

  /// No description provided for @productThumbnailSectionSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get productThumbnailSectionSaveAndClose;

  /// No description provided for @productVariantTreeCountOne.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String productVariantTreeCountOne(String count);

  /// No description provided for @productVariantTreeCountOther.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String productVariantTreeCountOther(String count);

  /// No description provided for @productVariantTreeAddPrices.
  ///
  /// In en, this message translates to:
  /// **'Add prices'**
  String get productVariantTreeAddPrices;

  /// No description provided for @productVariantsSectionAddVariant.
  ///
  /// In en, this message translates to:
  /// **'Add Variant'**
  String get productVariantsSectionAddVariant;

  /// No description provided for @productVariantsSectionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get productVariantsSectionCancel;

  /// No description provided for @productVariantsSectionSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get productVariantsSectionSaveAndClose;

  /// No description provided for @productVariantsSectionEditStockInventory.
  ///
  /// In en, this message translates to:
  /// **'Edit stock & inventory'**
  String get productVariantsSectionEditStockInventory;

  /// No description provided for @productVariantsSectionEditVariant.
  ///
  /// In en, this message translates to:
  /// **'Edit Variant'**
  String get productVariantsSectionEditVariant;

  /// No description provided for @editVariantsModalCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get editVariantsModalCancel;

  /// No description provided for @editVariantsModalSaveAndGoBack.
  ///
  /// In en, this message translates to:
  /// **'Save and go back'**
  String get editVariantsModalSaveAndGoBack;

  /// No description provided for @editVariantsModalSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get editVariantsModalSaveAndClose;

  /// No description provided for @editVariantsModalEditVariant.
  ///
  /// In en, this message translates to:
  /// **'Edit Variant'**
  String get editVariantsModalEditVariant;

  /// No description provided for @editVariantsModalUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Variants were successfully updated'**
  String get editVariantsModalUpdateSuccess;

  /// No description provided for @editVariantsModalEditVariants.
  ///
  /// In en, this message translates to:
  /// **'Edit Variants'**
  String get editVariantsModalEditVariants;

  /// No description provided for @editVariantsModalProductVariants.
  ///
  /// In en, this message translates to:
  /// **'Product variants'**
  String get editVariantsModalProductVariants;

  /// No description provided for @editVariantsModalVariant.
  ///
  /// In en, this message translates to:
  /// **'Variant'**
  String get editVariantsModalVariant;

  /// No description provided for @editVariantsModalInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get editVariantsModalInventory;

  /// No description provided for @productVariantsSectionEditPrices.
  ///
  /// In en, this message translates to:
  /// **'Edit Prices'**
  String get productVariantsSectionEditPrices;

  /// No description provided for @productVariantsSectionEditVariants.
  ///
  /// In en, this message translates to:
  /// **'Edit Variants'**
  String get productVariantsSectionEditVariants;

  /// No description provided for @productVariantsSectionEditOptions.
  ///
  /// In en, this message translates to:
  /// **'Edit Options'**
  String get productVariantsSectionEditOptions;

  /// No description provided for @productVariantsSectionProductVariants.
  ///
  /// In en, this message translates to:
  /// **'Product variants'**
  String get productVariantsSectionProductVariants;

  /// No description provided for @productVariantsSectionError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get productVariantsSectionError;

  /// No description provided for @productVariantsSectionFailedToUpdateProductOptions.
  ///
  /// In en, this message translates to:
  /// **'Failed to update product options'**
  String get productVariantsSectionFailedToUpdateProductOptions;

  /// No description provided for @productVariantsSectionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get productVariantsSectionSuccess;

  /// No description provided for @productVariantsSectionSuccessfullyUpdatedProductOptions.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated product options'**
  String get productVariantsSectionSuccessfullyUpdatedProductOptions;

  /// No description provided for @productVariantsSectionProductOptions.
  ///
  /// In en, this message translates to:
  /// **'Product options'**
  String get productVariantsSectionProductOptions;

  /// No description provided for @productVariantsSectionOptionTitle.
  ///
  /// In en, this message translates to:
  /// **'Option title'**
  String get productVariantsSectionOptionTitle;

  /// No description provided for @productVariantsSectionOptionTitleIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Option title is required'**
  String get productVariantsSectionOptionTitleIsRequired;

  /// No description provided for @productVariantsSectionAddAnOption.
  ///
  /// In en, this message translates to:
  /// **'Add an option'**
  String get productVariantsSectionAddAnOption;

  /// No description provided for @productVariantsSectionInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get productVariantsSectionInventory;

  /// No description provided for @productVariantsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get productVariantsSectionTitle;

  /// No description provided for @productVariantsSectionSku.
  ///
  /// In en, this message translates to:
  /// **'SKU'**
  String get productVariantsSectionSku;

  /// No description provided for @productVariantsSectionEan.
  ///
  /// In en, this message translates to:
  /// **'EAN'**
  String get productVariantsSectionEan;

  /// No description provided for @productVariantsSectionManageInventory.
  ///
  /// In en, this message translates to:
  /// **'Manage inventory'**
  String get productVariantsSectionManageInventory;

  /// No description provided for @productVariantsSectionDuplicateVariant.
  ///
  /// In en, this message translates to:
  /// **'Duplicate Variant'**
  String get productVariantsSectionDuplicateVariant;

  /// No description provided for @productVariantsSectionDeleteVariantLabel.
  ///
  /// In en, this message translates to:
  /// **'Delete Variant'**
  String get productVariantsSectionDeleteVariantLabel;

  /// No description provided for @productVariantsSectionYesDelete.
  ///
  /// In en, this message translates to:
  /// **'Yes, delete'**
  String get productVariantsSectionYesDelete;

  /// No description provided for @productVariantsSectionDeleteVariantHeading.
  ///
  /// In en, this message translates to:
  /// **'Delete variant'**
  String get productVariantsSectionDeleteVariantHeading;

  /// No description provided for @productVariantsSectionConfirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this variant? '**
  String get productVariantsSectionConfirmDelete;

  /// No description provided for @productVariantsSectionNoteDeletingTheVariantWillAlsoRemoveInventoryItemsAndLevels.
  ///
  /// In en, this message translates to:
  /// **' Note: Deleting the variant will also remove inventory items and levels'**
  String
      get productVariantsSectionNoteDeletingTheVariantWillAlsoRemoveInventoryItemsAndLevels;

  /// No description provided for @resetTokenCardError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get resetTokenCardError;

  /// No description provided for @resetTokenCardResetYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get resetTokenCardResetYourPassword;

  /// No description provided for @resetTokenCardPasswordResetDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address below, and we\'ll send you instructions on how to reset your password.'**
  String get resetTokenCardPasswordResetDescription;

  /// No description provided for @resetTokenCardEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get resetTokenCardEmail;

  /// No description provided for @resetTokenCardThisIsNotAValidEmail.
  ///
  /// In en, this message translates to:
  /// **'This is not a valid email'**
  String get resetTokenCardThisIsNotAValidEmail;

  /// No description provided for @resetTokenCardSendResetInstructions.
  ///
  /// In en, this message translates to:
  /// **'Send reset instructions'**
  String get resetTokenCardSendResetInstructions;

  /// No description provided for @resetTokenCardSuccessfullySentYouAnEmail.
  ///
  /// In en, this message translates to:
  /// **'Successfully sent you an email'**
  String get resetTokenCardSuccessfullySentYouAnEmail;

  /// No description provided for @resetTokenCardGoBackToSignIn.
  ///
  /// In en, this message translates to:
  /// **'Go back to sign in'**
  String get resetTokenCardGoBackToSignIn;

  /// No description provided for @rmaReturnProductTableProductDetails.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get rmaReturnProductTableProductDetails;

  /// No description provided for @rmaReturnProductTableQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get rmaReturnProductTableQuantity;

  /// No description provided for @rmaSelectProductTableProductDetails.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get rmaSelectProductTableProductDetails;

  /// No description provided for @rmaSelectProductTableQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get rmaSelectProductTableQuantity;

  /// No description provided for @rmaSelectProductTableRefundable.
  ///
  /// In en, this message translates to:
  /// **'Refundable'**
  String get rmaSelectProductTableRefundable;

  /// No description provided for @rmaSelectProductTableImagesWitchCountOne.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String rmaSelectProductTableImagesWitchCountOne(String count);

  /// No description provided for @rmaSelectProductTableImagesWitchCountOther.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String rmaSelectProductTableImagesWitchCountOther(String count);

  /// No description provided for @rmaSelectProductTableSelectReason.
  ///
  /// In en, this message translates to:
  /// **'Select Reason'**
  String get rmaSelectProductTableSelectReason;

  /// No description provided for @sidebarStore.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get sidebarStore;

  /// No description provided for @sidebarOrders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get sidebarOrders;

  /// No description provided for @sidebarProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get sidebarProducts;

  /// No description provided for @sidebarCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get sidebarCategories;

  /// No description provided for @sidebarCustomers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get sidebarCustomers;

  /// No description provided for @sidebarInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get sidebarInventory;

  /// No description provided for @sidebarDiscounts.
  ///
  /// In en, this message translates to:
  /// **'Discounts'**
  String get sidebarDiscounts;

  /// No description provided for @sidebarGiftCards.
  ///
  /// In en, this message translates to:
  /// **'Gift Cards'**
  String get sidebarGiftCards;

  /// No description provided for @sidebarPricing.
  ///
  /// In en, this message translates to:
  /// **'Pricing'**
  String get sidebarPricing;

  /// No description provided for @sidebarSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get sidebarSettings;

  /// No description provided for @tableContainerSoothedOffsetOne.
  ///
  /// In en, this message translates to:
  /// **'{soothedOffset} - {pageSize} of {count} {title}'**
  String tableContainerSoothedOffsetOne(
      String soothedOffset, String pageSize, String count, String title);

  /// No description provided for @tableContainerSoothedOffsetOther.
  ///
  /// In en, this message translates to:
  /// **'{soothedOffset} - {pageSize} of {count} {title}'**
  String tableContainerSoothedOffsetOther(
      String soothedOffset, String pageSize, String count, String title);

  /// No description provided for @tableContainerCurrentPage.
  ///
  /// In en, this message translates to:
  /// **'{currentPage} of {soothedPageCount}'**
  String tableContainerCurrentPage(String currentPage, String soothedPageCount);

  /// No description provided for @timelineRequestReturn.
  ///
  /// In en, this message translates to:
  /// **'Request Return'**
  String get timelineRequestReturn;

  /// No description provided for @timelineRegisterExchange.
  ///
  /// In en, this message translates to:
  /// **'Register Exchange'**
  String get timelineRegisterExchange;

  /// No description provided for @timelineRegisterClaim.
  ///
  /// In en, this message translates to:
  /// **'Register Claim'**
  String get timelineRegisterClaim;

  /// No description provided for @timelineSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get timelineSuccess;

  /// No description provided for @timelineAddedNote.
  ///
  /// In en, this message translates to:
  /// **'Added note'**
  String get timelineAddedNote;

  /// No description provided for @timelineError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get timelineError;

  /// No description provided for @timelineTimeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get timelineTimeline;

  /// No description provided for @uploadModalNew.
  ///
  /// In en, this message translates to:
  /// **'new'**
  String get uploadModalNew;

  /// No description provided for @uploadModalUpdates.
  ///
  /// In en, this message translates to:
  /// **'updates'**
  String get uploadModalUpdates;

  /// No description provided for @uploadModalDropYourFileHereOr.
  ///
  /// In en, this message translates to:
  /// **'Drop your file here, or'**
  String get uploadModalDropYourFileHereOr;

  /// No description provided for @uploadModalClickToBrowse.
  ///
  /// In en, this message translates to:
  /// **'click to browse.'**
  String get uploadModalClickToBrowse;

  /// No description provided for @uploadModalOnlyCsvFilesAreSupported.
  ///
  /// In en, this message translates to:
  /// **'Only .csv files are supported.'**
  String get uploadModalOnlyCsvFilesAreSupported;

  /// No description provided for @uploadModalImportFileTitle.
  ///
  /// In en, this message translates to:
  /// **'Import {fileTitle}'**
  String uploadModalImportFileTitle(String fileTitle);

  /// No description provided for @uploadModalCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get uploadModalCancel;

  /// No description provided for @uploadModalImportList.
  ///
  /// In en, this message translates to:
  /// **'Import List'**
  String get uploadModalImportList;

  /// No description provided for @addProductsModalAddProducts.
  ///
  /// In en, this message translates to:
  /// **'Add Products'**
  String get addProductsModalAddProducts;

  /// No description provided for @addProductsModalSearchByNameOrDescription.
  ///
  /// In en, this message translates to:
  /// **'Search by name or description...'**
  String get addProductsModalSearchByNameOrDescription;

  /// No description provided for @addProductsModalCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get addProductsModalCancel;

  /// No description provided for @addProductsModalSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get addProductsModalSave;

  /// No description provided for @addProductsModalProductDetails.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get addProductsModalProductDetails;

  /// No description provided for @addProductsModalStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get addProductsModalStatus;

  /// No description provided for @addProductsModalVariants.
  ///
  /// In en, this message translates to:
  /// **'Variants'**
  String get addProductsModalVariants;

  /// No description provided for @templatesGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get templatesGeneral;

  /// No description provided for @templatesFirstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get templatesFirstName;

  /// No description provided for @templatesLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get templatesLastName;

  /// No description provided for @templatesCompany.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get templatesCompany;

  /// No description provided for @templatesPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get templatesPhone;

  /// No description provided for @templatesBillingAddress.
  ///
  /// In en, this message translates to:
  /// **'Billing Address'**
  String get templatesBillingAddress;

  /// No description provided for @templatesShippingAddress.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get templatesShippingAddress;

  /// No description provided for @templatesAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get templatesAddress;

  /// No description provided for @templatesAddress1.
  ///
  /// In en, this message translates to:
  /// **'Address 1'**
  String get templatesAddress1;

  /// No description provided for @templatesAddress2.
  ///
  /// In en, this message translates to:
  /// **'Address 2'**
  String get templatesAddress2;

  /// No description provided for @templatesPostalCode.
  ///
  /// In en, this message translates to:
  /// **'Postal code'**
  String get templatesPostalCode;

  /// No description provided for @templatesCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get templatesCity;

  /// No description provided for @templatesProvince.
  ///
  /// In en, this message translates to:
  /// **'Province'**
  String get templatesProvince;

  /// No description provided for @templatesCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get templatesCountry;

  /// No description provided for @templatesMetadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get templatesMetadata;

  /// No description provided for @collectionModalSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get collectionModalSuccess;

  /// No description provided for @collectionModalSuccessfullyUpdatedCollection.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated collection'**
  String get collectionModalSuccessfullyUpdatedCollection;

  /// No description provided for @collectionModalError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get collectionModalError;

  /// No description provided for @collectionModalSuccessfullyCreatedCollection.
  ///
  /// In en, this message translates to:
  /// **'Successfully created collection'**
  String get collectionModalSuccessfullyCreatedCollection;

  /// No description provided for @collectionModalEditCollection.
  ///
  /// In en, this message translates to:
  /// **'Edit Collection'**
  String get collectionModalEditCollection;

  /// No description provided for @collectionModalAddCollection.
  ///
  /// In en, this message translates to:
  /// **'Add Collection'**
  String get collectionModalAddCollection;

  /// No description provided for @collectionModalDescription.
  ///
  /// In en, this message translates to:
  /// **'To create a collection, all you need is a title and a handle.'**
  String get collectionModalDescription;

  /// No description provided for @collectionModalDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get collectionModalDetails;

  /// No description provided for @collectionModalTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get collectionModalTitleLabel;

  /// No description provided for @collectionModalTitlePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Sunglasses'**
  String get collectionModalTitlePlaceholder;

  /// No description provided for @collectionModalHandleLabel.
  ///
  /// In en, this message translates to:
  /// **'Handle'**
  String get collectionModalHandleLabel;

  /// No description provided for @collectionModalHandlePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'sunglasses'**
  String get collectionModalHandlePlaceholder;

  /// No description provided for @collectionModalSlugDescription.
  ///
  /// In en, this message translates to:
  /// **'URL Slug for the collection. Will be auto generated if left blank.'**
  String get collectionModalSlugDescription;

  /// No description provided for @collectionModalMetadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get collectionModalMetadata;

  /// No description provided for @collectionModalCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get collectionModalCancel;

  /// No description provided for @collectionModalSaveCollection.
  ///
  /// In en, this message translates to:
  /// **'Save collection'**
  String get collectionModalSaveCollection;

  /// No description provided for @collectionModalPublishCollection.
  ///
  /// In en, this message translates to:
  /// **'Publish collection'**
  String get collectionModalPublishCollection;

  /// No description provided for @collectionProductTableAddProducts.
  ///
  /// In en, this message translates to:
  /// **'Add Products'**
  String get collectionProductTableAddProducts;

  /// No description provided for @collectionProductTableProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get collectionProductTableProducts;

  /// No description provided for @collectionProductTableSearchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search Products'**
  String get collectionProductTableSearchProducts;

  /// No description provided for @collectionProductTableCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get collectionProductTableCancel;

  /// No description provided for @collectionProductTableSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get collectionProductTableSave;

  /// No description provided for @collectionProductTableSortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get collectionProductTableSortBy;

  /// No description provided for @collectionProductTableAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get collectionProductTableAll;

  /// No description provided for @collectionProductTableNewest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get collectionProductTableNewest;

  /// No description provided for @collectionProductTableOldest.
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get collectionProductTableOldest;

  /// No description provided for @collectionProductTableTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get collectionProductTableTitle;

  /// No description provided for @collectionProductTableDecideStatusPublished.
  ///
  /// In en, this message translates to:
  /// **'Published'**
  String get collectionProductTableDecideStatusPublished;

  /// No description provided for @collectionProductTableDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get collectionProductTableDraft;

  /// No description provided for @collectionProductTableProposed.
  ///
  /// In en, this message translates to:
  /// **'Proposed'**
  String get collectionProductTableProposed;

  /// No description provided for @collectionProductTableRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get collectionProductTableRejected;

  /// No description provided for @collectionProductTableRemoveProductFromCollection.
  ///
  /// In en, this message translates to:
  /// **'Remove product from collection'**
  String get collectionProductTableRemoveProductFromCollection;

  /// No description provided for @collectionProductTableProductRemovedFromCollection.
  ///
  /// In en, this message translates to:
  /// **'Product removed from collection'**
  String get collectionProductTableProductRemovedFromCollection;

  /// No description provided for @collectionsTableDeleteCollection.
  ///
  /// In en, this message translates to:
  /// **'Delete Collection'**
  String get collectionsTableDeleteCollection;

  /// No description provided for @collectionsTableConfirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this collection?'**
  String get collectionsTableConfirmDelete;

  /// No description provided for @collectionsTableEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get collectionsTableEdit;

  /// No description provided for @collectionsTableDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get collectionsTableDelete;

  /// No description provided for @collectionsTableTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get collectionsTableTitle;

  /// No description provided for @collectionsTableHandle.
  ///
  /// In en, this message translates to:
  /// **'Handle'**
  String get collectionsTableHandle;

  /// No description provided for @collectionsTableCreatedAt.
  ///
  /// In en, this message translates to:
  /// **'Created At'**
  String get collectionsTableCreatedAt;

  /// No description provided for @collectionsTableUpdatedAt.
  ///
  /// In en, this message translates to:
  /// **'Updated At'**
  String get collectionsTableUpdatedAt;

  /// No description provided for @collectionsTableProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get collectionsTableProducts;

  /// No description provided for @customerGroupTableDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get customerGroupTableDetails;

  /// No description provided for @customerGroupTableDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get customerGroupTableDelete;

  /// No description provided for @customerGroupTableSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get customerGroupTableSuccess;

  /// No description provided for @customerGroupTableGroupDeleted.
  ///
  /// In en, this message translates to:
  /// **'Group deleted'**
  String get customerGroupTableGroupDeleted;

  /// No description provided for @customerGroupTableError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get customerGroupTableError;

  /// No description provided for @customerGroupTableFailedToDeleteTheGroup.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete the group'**
  String get customerGroupTableFailedToDeleteTheGroup;

  /// No description provided for @customerGroupTableCustomerGroups.
  ///
  /// In en, this message translates to:
  /// **'Customer groups'**
  String get customerGroupTableCustomerGroups;

  /// No description provided for @customerGroupTableDeleteFromTheGroup.
  ///
  /// In en, this message translates to:
  /// **'Delete from the group'**
  String get customerGroupTableDeleteFromTheGroup;

  /// No description provided for @customerGroupTableCustomerGroupsTitle.
  ///
  /// In en, this message translates to:
  /// **'Customer Groups'**
  String get customerGroupTableCustomerGroupsTitle;

  /// No description provided for @customerGroupTableGroups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get customerGroupTableGroups;

  /// No description provided for @customerGroupTableAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get customerGroupTableAll;

  /// No description provided for @customerGroupTableEditCustomers.
  ///
  /// In en, this message translates to:
  /// **'Edit Customers'**
  String get customerGroupTableEditCustomers;

  /// No description provided for @customerGroupTableCustomers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customerGroupTableCustomers;

  /// No description provided for @customerGroupTableCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get customerGroupTableCancel;

  /// No description provided for @customerGroupTableSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get customerGroupTableSave;

  /// No description provided for @customerOrdersTableOrders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get customerOrdersTableOrders;

  /// No description provided for @customerOrdersTableTransferOrder.
  ///
  /// In en, this message translates to:
  /// **'Transfer order'**
  String get customerOrdersTableTransferOrder;

  /// No description provided for @customerOrdersTablePaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get customerOrdersTablePaid;

  /// No description provided for @customerOrdersTableAwaiting.
  ///
  /// In en, this message translates to:
  /// **'Awaiting'**
  String get customerOrdersTableAwaiting;

  /// No description provided for @customerOrdersTableRequiresAction.
  ///
  /// In en, this message translates to:
  /// **'Requires action'**
  String get customerOrdersTableRequiresAction;

  /// No description provided for @customerOrdersTableNA.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get customerOrdersTableNA;

  /// No description provided for @customerOrdersTableFulfilled.
  ///
  /// In en, this message translates to:
  /// **'Fulfilled'**
  String get customerOrdersTableFulfilled;

  /// No description provided for @customerOrdersTableShipped.
  ///
  /// In en, this message translates to:
  /// **'Shipped'**
  String get customerOrdersTableShipped;

  /// No description provided for @customerOrdersTableNotFulfilled.
  ///
  /// In en, this message translates to:
  /// **'Not fulfilled'**
  String get customerOrdersTableNotFulfilled;

  /// No description provided for @customerOrdersTablePartiallyFulfilled.
  ///
  /// In en, this message translates to:
  /// **'Partially fulfilled'**
  String get customerOrdersTablePartiallyFulfilled;

  /// No description provided for @customerOrdersTablePartiallyShipped.
  ///
  /// In en, this message translates to:
  /// **'Partially shipped'**
  String get customerOrdersTablePartiallyShipped;

  /// No description provided for @customerOrdersTableOrder.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get customerOrdersTableOrder;

  /// No description provided for @customerOrdersTableRemainderMore.
  ///
  /// In en, this message translates to:
  /// **'+ {remainder} more'**
  String customerOrdersTableRemainderMore(String remainder);

  /// No description provided for @customerOrdersTableDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get customerOrdersTableDate;

  /// No description provided for @customerOrdersTableFulfillment.
  ///
  /// In en, this message translates to:
  /// **'Fulfillment'**
  String get customerOrdersTableFulfillment;

  /// No description provided for @customerOrdersTableStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get customerOrdersTableStatus;

  /// No description provided for @customerOrdersTableTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get customerOrdersTableTotal;

  /// No description provided for @customerTableCustomers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customerTableCustomers;

  /// No description provided for @customerTableEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get customerTableEdit;

  /// No description provided for @customerTableDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get customerTableDetails;

  /// No description provided for @customerTableDateAdded.
  ///
  /// In en, this message translates to:
  /// **'Date added'**
  String get customerTableDateAdded;

  /// No description provided for @customerTableName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get customerTableName;

  /// No description provided for @customerTableEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get customerTableEmail;

  /// No description provided for @customerTableOrders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get customerTableOrders;

  /// No description provided for @discountFilterDropdownFilters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get discountFilterDropdownFilters;

  /// No description provided for @discountTableDiscounts.
  ///
  /// In en, this message translates to:
  /// **'Discounts'**
  String get discountTableDiscounts;

  /// No description provided for @discountTableSearchByCodeOrDescription.
  ///
  /// In en, this message translates to:
  /// **'Search by code or description...'**
  String get discountTableSearchByCodeOrDescription;

  /// No description provided for @discountTableSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get discountTableSuccess;

  /// No description provided for @discountTableSuccessfullyCopiedDiscount.
  ///
  /// In en, this message translates to:
  /// **'Successfully copied discount'**
  String get discountTableSuccessfullyCopiedDiscount;

  /// No description provided for @discountTableError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get discountTableError;

  /// No description provided for @discountTableScheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get discountTableScheduled;

  /// No description provided for @discountTableExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get discountTableExpired;

  /// No description provided for @discountTableActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get discountTableActive;

  /// No description provided for @discountTableDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get discountTableDisabled;

  /// No description provided for @discountTableFreeShipping.
  ///
  /// In en, this message translates to:
  /// **'Free Shipping'**
  String get discountTableFreeShipping;

  /// No description provided for @discountTableCode.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get discountTableCode;

  /// No description provided for @discountTableDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get discountTableDescription;

  /// No description provided for @discountTableAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get discountTableAmount;

  /// No description provided for @discountTableStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get discountTableStatus;

  /// No description provided for @discountTableRedemptions.
  ///
  /// In en, this message translates to:
  /// **'Redemptions'**
  String get discountTableRedemptions;

  /// No description provided for @discountTableDeleteDiscount.
  ///
  /// In en, this message translates to:
  /// **'Delete Discount'**
  String get discountTableDeleteDiscount;

  /// No description provided for @discountTableConfirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this Discount?'**
  String get discountTableConfirmDelete;

  /// No description provided for @discountTablePublish.
  ///
  /// In en, this message translates to:
  /// **'Publish'**
  String get discountTablePublish;

  /// No description provided for @discountTableUnpublish.
  ///
  /// In en, this message translates to:
  /// **'Unpublish'**
  String get discountTableUnpublish;

  /// No description provided for @discountTableSuccessfullyPublishedDiscount.
  ///
  /// In en, this message translates to:
  /// **'Successfully published discount'**
  String get discountTableSuccessfullyPublishedDiscount;

  /// No description provided for @discountTableSuccessfullyUnpublishedDiscount.
  ///
  /// In en, this message translates to:
  /// **'Successfully unpublished discount'**
  String get discountTableSuccessfullyUnpublishedDiscount;

  /// No description provided for @discountTableDuplicate.
  ///
  /// In en, this message translates to:
  /// **'Duplicate'**
  String get discountTableDuplicate;

  /// No description provided for @discountTableDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get discountTableDelete;

  /// No description provided for @draftOrderTableDraftOrders.
  ///
  /// In en, this message translates to:
  /// **'Draft Orders'**
  String get draftOrderTableDraftOrders;

  /// No description provided for @draftOrderTableCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get draftOrderTableCompleted;

  /// No description provided for @draftOrderTableOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get draftOrderTableOpen;

  /// No description provided for @draftOrderTableDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get draftOrderTableDraft;

  /// No description provided for @draftOrderTableOrder.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get draftOrderTableOrder;

  /// No description provided for @draftOrderTableDateAdded.
  ///
  /// In en, this message translates to:
  /// **'Date added'**
  String get draftOrderTableDateAdded;

  /// No description provided for @draftOrderTableCustomer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get draftOrderTableCustomer;

  /// No description provided for @draftOrderTableStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get draftOrderTableStatus;

  /// No description provided for @giftCardFilterDropdownIsInTheLast.
  ///
  /// In en, this message translates to:
  /// **'is in the last'**
  String get giftCardFilterDropdownIsInTheLast;

  /// No description provided for @giftCardFilterDropdownIsOlderThan.
  ///
  /// In en, this message translates to:
  /// **'is older than'**
  String get giftCardFilterDropdownIsOlderThan;

  /// No description provided for @giftCardFilterDropdownIsAfter.
  ///
  /// In en, this message translates to:
  /// **'is after'**
  String get giftCardFilterDropdownIsAfter;

  /// No description provided for @giftCardFilterDropdownIsBefore.
  ///
  /// In en, this message translates to:
  /// **'is before'**
  String get giftCardFilterDropdownIsBefore;

  /// No description provided for @giftCardFilterDropdownIsEqualTo.
  ///
  /// In en, this message translates to:
  /// **'is equal to'**
  String get giftCardFilterDropdownIsEqualTo;

  /// No description provided for @giftCardFilterDropdownFilters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get giftCardFilterDropdownFilters;

  /// No description provided for @giftCardFilterDropdownStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get giftCardFilterDropdownStatus;

  /// No description provided for @giftCardFilterDropdownPaymentStatus.
  ///
  /// In en, this message translates to:
  /// **'Payment Status'**
  String get giftCardFilterDropdownPaymentStatus;

  /// No description provided for @giftCardFilterDropdownFulfillmentStatus.
  ///
  /// In en, this message translates to:
  /// **'Fulfillment Status'**
  String get giftCardFilterDropdownFulfillmentStatus;

  /// No description provided for @giftCardFilterDropdownDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get giftCardFilterDropdownDate;

  /// No description provided for @giftCardTableGiftCards.
  ///
  /// In en, this message translates to:
  /// **'Gift cards'**
  String get giftCardTableGiftCards;

  /// No description provided for @giftCardTableCode.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get giftCardTableCode;

  /// No description provided for @giftCardTableOrder.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get giftCardTableOrder;

  /// No description provided for @giftCardTableOriginalAmount.
  ///
  /// In en, this message translates to:
  /// **'Original Amount'**
  String get giftCardTableOriginalAmount;

  /// No description provided for @giftCardTableBalance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get giftCardTableBalance;

  /// No description provided for @giftCardTableRegionHasBeenDeleted.
  ///
  /// In en, this message translates to:
  /// **'Region has been deleted'**
  String get giftCardTableRegionHasBeenDeleted;

  /// No description provided for @giftCardTableNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get giftCardTableNone;

  /// No description provided for @giftCardTableCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get giftCardTableCreated;

  /// No description provided for @imageTableFileName.
  ///
  /// In en, this message translates to:
  /// **'File name'**
  String get imageTableFileName;

  /// No description provided for @imageTableThumbnail.
  ///
  /// In en, this message translates to:
  /// **'Thumbnail'**
  String get imageTableThumbnail;

  /// No description provided for @imageTableSelectThumbnailImageForProduct.
  ///
  /// In en, this message translates to:
  /// **'Select which image you want to use as the thumbnail for this product'**
  String get imageTableSelectThumbnailImageForProduct;

  /// No description provided for @inventoryTableInventoryItems.
  ///
  /// In en, this message translates to:
  /// **'Inventory Items'**
  String get inventoryTableInventoryItems;

  /// No description provided for @inventoryTableActionsAdjustAvailability.
  ///
  /// In en, this message translates to:
  /// **'Adjust Availability'**
  String get inventoryTableActionsAdjustAvailability;

  /// No description provided for @inventoryTableViewProduct.
  ///
  /// In en, this message translates to:
  /// **'View Product'**
  String get inventoryTableViewProduct;

  /// No description provided for @inventoryTableSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get inventoryTableSuccess;

  /// No description provided for @inventoryTableInventoryItemUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Inventory item updated successfully'**
  String get inventoryTableInventoryItemUpdatedSuccessfully;

  /// No description provided for @inventoryTableAdjustAvailability.
  ///
  /// In en, this message translates to:
  /// **'Adjust availability'**
  String get inventoryTableAdjustAvailability;

  /// No description provided for @inventoryTableCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get inventoryTableCancel;

  /// No description provided for @inventoryTableSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get inventoryTableSaveAndClose;

  /// No description provided for @inventoryTableItem.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get inventoryTableItem;

  /// No description provided for @inventoryTableVariant.
  ///
  /// In en, this message translates to:
  /// **'Variant'**
  String get inventoryTableVariant;

  /// No description provided for @inventoryTableSku.
  ///
  /// In en, this message translates to:
  /// **'SKU'**
  String get inventoryTableSku;

  /// No description provided for @inventoryTableReserved.
  ///
  /// In en, this message translates to:
  /// **'Reserved'**
  String get inventoryTableReserved;

  /// No description provided for @inventoryTableInStock.
  ///
  /// In en, this message translates to:
  /// **'In stock'**
  String get inventoryTableInStock;

  /// No description provided for @orderFilterDropdownFilters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get orderFilterDropdownFilters;

  /// No description provided for @orderFilterDropdownStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get orderFilterDropdownStatus;

  /// No description provided for @orderFilterDropdownPaymentStatus.
  ///
  /// In en, this message translates to:
  /// **'Payment Status'**
  String get orderFilterDropdownPaymentStatus;

  /// No description provided for @orderFilterDropdownFulfillmentStatus.
  ///
  /// In en, this message translates to:
  /// **'Fulfillment Status'**
  String get orderFilterDropdownFulfillmentStatus;

  /// No description provided for @orderFilterDropdownRegions.
  ///
  /// In en, this message translates to:
  /// **'Regions'**
  String get orderFilterDropdownRegions;

  /// No description provided for @orderFilterDropdownSalesChannel.
  ///
  /// In en, this message translates to:
  /// **'Sales Channel'**
  String get orderFilterDropdownSalesChannel;

  /// No description provided for @orderFilterDropdownDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get orderFilterDropdownDate;

  /// No description provided for @orderTablePaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get orderTablePaid;

  /// No description provided for @orderTableAwaiting.
  ///
  /// In en, this message translates to:
  /// **'Awaiting'**
  String get orderTableAwaiting;

  /// No description provided for @orderTableRequiresAction.
  ///
  /// In en, this message translates to:
  /// **'Requires action'**
  String get orderTableRequiresAction;

  /// No description provided for @orderTableCanceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get orderTableCanceled;

  /// No description provided for @orderTableNA.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get orderTableNA;

  /// No description provided for @orderTableOrder.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get orderTableOrder;

  /// No description provided for @orderTableDateAdded.
  ///
  /// In en, this message translates to:
  /// **'Date added'**
  String get orderTableDateAdded;

  /// No description provided for @orderTableCustomer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get orderTableCustomer;

  /// No description provided for @orderTableFulfillment.
  ///
  /// In en, this message translates to:
  /// **'Fulfillment'**
  String get orderTableFulfillment;

  /// No description provided for @orderTablePaymentStatus.
  ///
  /// In en, this message translates to:
  /// **'Payment status'**
  String get orderTablePaymentStatus;

  /// No description provided for @orderTableSalesChannel.
  ///
  /// In en, this message translates to:
  /// **'Sales Channel'**
  String get orderTableSalesChannel;

  /// No description provided for @orderTableTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get orderTableTotal;

  /// No description provided for @orderTableFiltersComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get orderTableFiltersComplete;

  /// No description provided for @orderTableFiltersIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Incomplete'**
  String get orderTableFiltersIncomplete;

  /// No description provided for @priceListTableFilters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get priceListTableFilters;

  /// No description provided for @priceListTableStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get priceListTableStatus;

  /// No description provided for @priceListTableType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get priceListTableType;

  /// No description provided for @priceListTablePriceLists.
  ///
  /// In en, this message translates to:
  /// **'Price Lists'**
  String get priceListTablePriceLists;

  /// No description provided for @priceListTableSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get priceListTableSuccess;

  /// No description provided for @priceListTableSuccessfullyCopiedPriceList.
  ///
  /// In en, this message translates to:
  /// **'Successfully copied price list'**
  String get priceListTableSuccessfullyCopiedPriceList;

  /// No description provided for @priceListTableError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get priceListTableError;

  /// No description provided for @priceListTableDeletePriceList.
  ///
  /// In en, this message translates to:
  /// **'Delete Price List'**
  String get priceListTableDeletePriceList;

  /// No description provided for @priceListTableConfirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this price list?'**
  String get priceListTableConfirmDelete;

  /// No description provided for @priceListTableSuccessfullyDeletedThePriceList.
  ///
  /// In en, this message translates to:
  /// **'Successfully deleted the price list'**
  String get priceListTableSuccessfullyDeletedThePriceList;

  /// No description provided for @priceListTableSuccessfullyUnpublishedPriceList.
  ///
  /// In en, this message translates to:
  /// **'Successfully unpublished price list'**
  String get priceListTableSuccessfullyUnpublishedPriceList;

  /// No description provided for @priceListTableSuccessfullyPublishedPriceList.
  ///
  /// In en, this message translates to:
  /// **'Successfully published price list'**
  String get priceListTableSuccessfullyPublishedPriceList;

  /// No description provided for @priceListTableUnpublish.
  ///
  /// In en, this message translates to:
  /// **'Unpublish'**
  String get priceListTableUnpublish;

  /// No description provided for @priceListTablePublish.
  ///
  /// In en, this message translates to:
  /// **'Publish'**
  String get priceListTablePublish;

  /// No description provided for @priceListTableDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get priceListTableDelete;

  /// No description provided for @priceListTableName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get priceListTableName;

  /// No description provided for @priceListTableDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get priceListTableDescription;

  /// No description provided for @priceListTableGroups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get priceListTableGroups;

  /// No description provided for @priceListTableOtherMore.
  ///
  /// In en, this message translates to:
  /// **'+ {other} more'**
  String priceListTableOtherMore(String other);

  /// No description provided for @priceOverridesApplyOverridesOnSelectedVariants.
  ///
  /// In en, this message translates to:
  /// **'Apply overrides on selected variants'**
  String get priceOverridesApplyOverridesOnSelectedVariants;

  /// No description provided for @priceOverridesApplyOnAllVariants.
  ///
  /// In en, this message translates to:
  /// **'Apply on all variants'**
  String get priceOverridesApplyOnAllVariants;

  /// No description provided for @priceOverridesPrices.
  ///
  /// In en, this message translates to:
  /// **'Prices'**
  String get priceOverridesPrices;

  /// No description provided for @priceOverridesCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get priceOverridesCancel;

  /// No description provided for @priceOverridesSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get priceOverridesSaveAndClose;

  /// No description provided for @priceOverridesShowRegions.
  ///
  /// In en, this message translates to:
  /// **'Show regions'**
  String get priceOverridesShowRegions;

  /// No description provided for @productTableProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get productTableProducts;

  /// No description provided for @productTableCopySuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get productTableCopySuccess;

  /// No description provided for @productTableCopyCreatedANewProduct.
  ///
  /// In en, this message translates to:
  /// **'Created a new product'**
  String get productTableCopyCreatedANewProduct;

  /// No description provided for @productTableCopyError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get productTableCopyError;

  /// No description provided for @productTableDeleteProduct.
  ///
  /// In en, this message translates to:
  /// **'Delete Product'**
  String get productTableDeleteProduct;

  /// No description provided for @productTableConfirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this product?'**
  String get productTableConfirmDelete;

  /// No description provided for @productTableEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get productTableEdit;

  /// No description provided for @productTableUnpublish.
  ///
  /// In en, this message translates to:
  /// **'Unpublish'**
  String get productTableUnpublish;

  /// No description provided for @productTablePublish.
  ///
  /// In en, this message translates to:
  /// **'Publish'**
  String get productTablePublish;

  /// No description provided for @productTableDraft.
  ///
  /// In en, this message translates to:
  /// **'draft'**
  String get productTableDraft;

  /// No description provided for @productTablePublished.
  ///
  /// In en, this message translates to:
  /// **'published'**
  String get productTablePublished;

  /// No description provided for @productTableSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get productTableSuccess;

  /// No description provided for @productTableSuccessfullyUnpublishedProduct.
  ///
  /// In en, this message translates to:
  /// **'Successfully unpublished product'**
  String get productTableSuccessfullyUnpublishedProduct;

  /// No description provided for @productTableSuccessfullyPublishedProduct.
  ///
  /// In en, this message translates to:
  /// **'Successfully published product'**
  String get productTableSuccessfullyPublishedProduct;

  /// No description provided for @productTableError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get productTableError;

  /// No description provided for @productTableDuplicate.
  ///
  /// In en, this message translates to:
  /// **'Duplicate'**
  String get productTableDuplicate;

  /// No description provided for @productTableDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get productTableDelete;

  /// No description provided for @productTableProposed.
  ///
  /// In en, this message translates to:
  /// **'Proposed'**
  String get productTableProposed;

  /// No description provided for @productTablePublishedTitle.
  ///
  /// In en, this message translates to:
  /// **'Published'**
  String get productTablePublishedTitle;

  /// No description provided for @productTableRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get productTableRejected;

  /// No description provided for @productTableDraftTitle.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get productTableDraftTitle;

  /// No description provided for @productTableName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get productTableName;

  /// No description provided for @productTableCollection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get productTableCollection;

  /// No description provided for @productTableStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get productTableStatus;

  /// No description provided for @productTableAvailability.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get productTableAvailability;

  /// No description provided for @productTableInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get productTableInventory;

  /// No description provided for @productTableInventoryInStockCountOne.
  ///
  /// In en, this message translates to:
  /// **' in stock for {count} variant(s)'**
  String productTableInventoryInStockCountOne(String count);

  /// No description provided for @productTableInventoryInStockCountOther.
  ///
  /// In en, this message translates to:
  /// **' in stock for {count} variant(s)'**
  String productTableInventoryInStockCountOther(String count);

  /// No description provided for @reservationFormLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get reservationFormLocation;

  /// No description provided for @reservationFormChooseWhereYouWishToReserveFrom.
  ///
  /// In en, this message translates to:
  /// **'Choose where you wish to reserve from.'**
  String get reservationFormChooseWhereYouWishToReserveFrom;

  /// No description provided for @reservationFormItemToReserve.
  ///
  /// In en, this message translates to:
  /// **'Item to reserve'**
  String get reservationFormItemToReserve;

  /// No description provided for @reservationFormSelectTheItemThatYouWishToReserve.
  ///
  /// In en, this message translates to:
  /// **'Select the item that you wish to reserve.'**
  String get reservationFormSelectTheItemThatYouWishToReserve;

  /// No description provided for @reservationFormItem.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get reservationFormItem;

  /// No description provided for @reservationFormInStock.
  ///
  /// In en, this message translates to:
  /// **'In stock'**
  String get reservationFormInStock;

  /// No description provided for @reservationFormAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get reservationFormAvailable;

  /// No description provided for @reservationFormReserve.
  ///
  /// In en, this message translates to:
  /// **'Reserve'**
  String get reservationFormReserve;

  /// No description provided for @reservationFormRemoveItem.
  ///
  /// In en, this message translates to:
  /// **'Remove item'**
  String get reservationFormRemoveItem;

  /// No description provided for @reservationFormDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get reservationFormDescription;

  /// No description provided for @reservationFormWhatTypeOfReservationIsThis.
  ///
  /// In en, this message translates to:
  /// **'What type of reservation is this?'**
  String get reservationFormWhatTypeOfReservationIsThis;

  /// No description provided for @reservationsTableReservations.
  ///
  /// In en, this message translates to:
  /// **'Reservations'**
  String get reservationsTableReservations;

  /// No description provided for @reservationsTableEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get reservationsTableEdit;

  /// No description provided for @reservationsTableDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get reservationsTableDelete;

  /// No description provided for @reservationsTableConfirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this reservation?'**
  String get reservationsTableConfirmDelete;

  /// No description provided for @reservationsTableRemoveReservation.
  ///
  /// In en, this message translates to:
  /// **'Remove reservation'**
  String get reservationsTableRemoveReservation;

  /// No description provided for @reservationsTableReservationHasBeenRemoved.
  ///
  /// In en, this message translates to:
  /// **'Reservation has been removed'**
  String get reservationsTableReservationHasBeenRemoved;

  /// No description provided for @newSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get newSuccess;

  /// No description provided for @newSuccessfullyCreatedReservation.
  ///
  /// In en, this message translates to:
  /// **'Successfully created reservation'**
  String get newSuccessfullyCreatedReservation;

  /// No description provided for @newError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get newError;

  /// No description provided for @newCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get newCancel;

  /// No description provided for @newSaveReservation.
  ///
  /// In en, this message translates to:
  /// **'Save reservation'**
  String get newSaveReservation;

  /// No description provided for @newReserveItem.
  ///
  /// In en, this message translates to:
  /// **'Reserve Item'**
  String get newReserveItem;

  /// No description provided for @newMetadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get newMetadata;

  /// No description provided for @reservationsTableOrderId.
  ///
  /// In en, this message translates to:
  /// **'Order ID'**
  String get reservationsTableOrderId;

  /// No description provided for @reservationsTableDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get reservationsTableDescription;

  /// No description provided for @reservationsTableCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get reservationsTableCreated;

  /// No description provided for @reservationsTableQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get reservationsTableQuantity;

  /// No description provided for @searchModalStartTypingToSearch.
  ///
  /// In en, this message translates to:
  /// **'Start typing to search...'**
  String get searchModalStartTypingToSearch;

  /// No description provided for @searchModalClearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get searchModalClearSearch;

  /// No description provided for @searchModalOr.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get searchModalOr;

  /// No description provided for @searchModalToNavigate.
  ///
  /// In en, this message translates to:
  /// **'to navigate'**
  String get searchModalToNavigate;

  /// No description provided for @searchModalToSelectAnd.
  ///
  /// In en, this message translates to:
  /// **'to select, and'**
  String get searchModalToSelectAnd;

  /// No description provided for @searchModalToSearchAnytime.
  ///
  /// In en, this message translates to:
  /// **'to search anytime'**
  String get searchModalToSearchAnytime;

  /// No description provided for @templatesSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get templatesSettings;

  /// No description provided for @templatesManageTheSettingsForYourMedusaStore.
  ///
  /// In en, this message translates to:
  /// **'Manage the settings for your Medusa store'**
  String get templatesManageTheSettingsForYourMedusaStore;

  /// No description provided for @transferOrdersModalInfo.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get transferOrdersModalInfo;

  /// No description provided for @transferOrdersModalCustomerIsAlreadyTheOwnerOfTheOrder.
  ///
  /// In en, this message translates to:
  /// **'Customer is already the owner of the order'**
  String get transferOrdersModalCustomerIsAlreadyTheOwnerOfTheOrder;

  /// No description provided for @transferOrdersModalSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get transferOrdersModalSuccess;

  /// No description provided for @transferOrdersModalSuccessfullyTransferredOrderToDifferentCustomer.
  ///
  /// In en, this message translates to:
  /// **'Successfully transferred order to different customer'**
  String get transferOrdersModalSuccessfullyTransferredOrderToDifferentCustomer;

  /// No description provided for @transferOrdersModalError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get transferOrdersModalError;

  /// No description provided for @transferOrdersModalCouldNotTransferOrderToDifferentCustomer.
  ///
  /// In en, this message translates to:
  /// **'Could not transfer order to different customer'**
  String get transferOrdersModalCouldNotTransferOrderToDifferentCustomer;

  /// No description provided for @transferOrdersModalTransferOrder.
  ///
  /// In en, this message translates to:
  /// **'Transfer order'**
  String get transferOrdersModalTransferOrder;

  /// No description provided for @transferOrdersModalOrder.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get transferOrdersModalOrder;

  /// No description provided for @transferOrdersModalCurrentOwner.
  ///
  /// In en, this message translates to:
  /// **'Current Owner'**
  String get transferOrdersModalCurrentOwner;

  /// No description provided for @transferOrdersModalTheCustomerCurrentlyRelatedToThisOrder.
  ///
  /// In en, this message translates to:
  /// **'The customer currently related to this order'**
  String get transferOrdersModalTheCustomerCurrentlyRelatedToThisOrder;

  /// No description provided for @transferOrdersModalNewOwner.
  ///
  /// In en, this message translates to:
  /// **'New Owner'**
  String get transferOrdersModalNewOwner;

  /// No description provided for @transferOrdersModalTheCustomerToTransferThisOrderTo.
  ///
  /// In en, this message translates to:
  /// **'The customer to transfer this order to'**
  String get transferOrdersModalTheCustomerToTransferThisOrderTo;

  /// No description provided for @transferOrdersModalCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get transferOrdersModalCancel;

  /// No description provided for @transferOrdersModalConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get transferOrdersModalConfirm;

  /// No description provided for @templatesEditUser.
  ///
  /// In en, this message translates to:
  /// **'Edit User'**
  String get templatesEditUser;

  /// No description provided for @templatesRemoveUser.
  ///
  /// In en, this message translates to:
  /// **'Remove User'**
  String get templatesRemoveUser;

  /// No description provided for @templatesResendInvitation.
  ///
  /// In en, this message translates to:
  /// **'Resend Invitation'**
  String get templatesResendInvitation;

  /// No description provided for @templatesSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get templatesSuccess;

  /// No description provided for @templatesInvitiationLinkHasBeenResent.
  ///
  /// In en, this message translates to:
  /// **'Invitation link has been resent'**
  String get templatesInvitiationLinkHasBeenResent;

  /// No description provided for @templatesCopyInviteLink.
  ///
  /// In en, this message translates to:
  /// **'Copy invite link'**
  String get templatesCopyInviteLink;

  /// No description provided for @templatesInviteLinkCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Invite link copied to clipboard'**
  String get templatesInviteLinkCopiedToClipboard;

  /// No description provided for @templatesRemoveInvitation.
  ///
  /// In en, this message translates to:
  /// **'Remove Invitation'**
  String get templatesRemoveInvitation;

  /// No description provided for @templatesExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get templatesExpired;

  /// No description provided for @templatesPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get templatesPending;

  /// No description provided for @templatesAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get templatesAll;

  /// No description provided for @templatesMember.
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get templatesMember;

  /// No description provided for @templatesAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get templatesAdmin;

  /// No description provided for @templatesNoTeamPermissions.
  ///
  /// In en, this message translates to:
  /// **'No team permissions'**
  String get templatesNoTeamPermissions;

  /// No description provided for @templatesStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get templatesStatus;

  /// No description provided for @templatesActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get templatesActive;

  /// No description provided for @templatesName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get templatesName;

  /// No description provided for @templatesEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get templatesEmail;

  /// No description provided for @templatesTeamPermissions.
  ///
  /// In en, this message translates to:
  /// **'Team permissions'**
  String get templatesTeamPermissions;

  /// No description provided for @templatesConfirmRemove.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this user?'**
  String get templatesConfirmRemove;

  /// No description provided for @templatesRemoveUserHeading.
  ///
  /// In en, this message translates to:
  /// **'Remove user'**
  String get templatesRemoveUserHeading;

  /// No description provided for @templatesUserHasBeenRemoved.
  ///
  /// In en, this message translates to:
  /// **'User has been removed'**
  String get templatesUserHasBeenRemoved;

  /// No description provided for @templatesConfirmRemoveInvite.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this invite?'**
  String get templatesConfirmRemoveInvite;

  /// No description provided for @templatesRemoveInvite.
  ///
  /// In en, this message translates to:
  /// **'Remove invite'**
  String get templatesRemoveInvite;

  /// No description provided for @templatesInvitiationHasBeenRemoved.
  ///
  /// In en, this message translates to:
  /// **'Invitation has been removed'**
  String get templatesInvitiationHasBeenRemoved;

  /// No description provided for @multiselectChooseCategories.
  ///
  /// In en, this message translates to:
  /// **'Choose categories'**
  String get multiselectChooseCategories;

  /// No description provided for @domainCategoriesMultiselectSelectedWithCountsOne.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String domainCategoriesMultiselectSelectedWithCountsOne(String count);

  /// No description provided for @domainCategoriesMultiselectSelectedWithCountsOther.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String domainCategoriesMultiselectSelectedWithCountsOther(String count);

  /// No description provided for @detailsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get detailsSuccess;

  /// No description provided for @detailsUpdatedProductsInCollection.
  ///
  /// In en, this message translates to:
  /// **'Updated products in collection'**
  String get detailsUpdatedProductsInCollection;

  /// No description provided for @detailsError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get detailsError;

  /// No description provided for @detailsBackToCollections.
  ///
  /// In en, this message translates to:
  /// **'Back to Collections'**
  String get detailsBackToCollections;

  /// No description provided for @detailsEditCollection.
  ///
  /// In en, this message translates to:
  /// **'Edit Collection'**
  String get detailsEditCollection;

  /// No description provided for @detailsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get detailsDelete;

  /// No description provided for @detailsMetadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get detailsMetadata;

  /// No description provided for @detailsEditProducts.
  ///
  /// In en, this message translates to:
  /// **'Edit Products'**
  String get detailsEditProducts;

  /// No description provided for @detailsProductsInThisCollection.
  ///
  /// In en, this message translates to:
  /// **'Products in this collection'**
  String get detailsProductsInThisCollection;

  /// No description provided for @detailsRawCollection.
  ///
  /// In en, this message translates to:
  /// **'Raw collection'**
  String get detailsRawCollection;

  /// No description provided for @detailsDeleteCollection.
  ///
  /// In en, this message translates to:
  /// **'Delete collection'**
  String get detailsDeleteCollection;

  /// No description provided for @detailsSuccessfullyDeletedCollection.
  ///
  /// In en, this message translates to:
  /// **'Successfully deleted collection'**
  String get detailsSuccessfullyDeletedCollection;

  /// No description provided for @detailsYesDelete.
  ///
  /// In en, this message translates to:
  /// **'Yes, delete'**
  String get detailsYesDelete;

  /// No description provided for @detailsSuccessfullyUpdatedCustomer.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated customer'**
  String get detailsSuccessfullyUpdatedCustomer;

  /// No description provided for @detailsCustomerDetails.
  ///
  /// In en, this message translates to:
  /// **'Customer Details'**
  String get detailsCustomerDetails;

  /// No description provided for @detailsGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get detailsGeneral;

  /// No description provided for @detailsFirstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get detailsFirstName;

  /// No description provided for @detailsLebron.
  ///
  /// In en, this message translates to:
  /// **'Lebron'**
  String get detailsLebron;

  /// No description provided for @detailsLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get detailsLastName;

  /// No description provided for @detailsJames.
  ///
  /// In en, this message translates to:
  /// **'James'**
  String get detailsJames;

  /// No description provided for @detailsEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get detailsEmail;

  /// No description provided for @detailsPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get detailsPhoneNumber;

  /// No description provided for @detailsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get detailsCancel;

  /// No description provided for @detailsSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get detailsSaveAndClose;

  /// No description provided for @detailsEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get detailsEdit;

  /// No description provided for @detailsBackToCustomers.
  ///
  /// In en, this message translates to:
  /// **'Back to Customers'**
  String get detailsBackToCustomers;

  /// No description provided for @detailsFirstSeen.
  ///
  /// In en, this message translates to:
  /// **'First seen'**
  String get detailsFirstSeen;

  /// No description provided for @detailsPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get detailsPhone;

  /// No description provided for @detailsOrders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get detailsOrders;

  /// No description provided for @detailsUser.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get detailsUser;

  /// No description provided for @detailsOrdersOne.
  ///
  /// In en, this message translates to:
  /// **'Orders {count}'**
  String detailsOrdersOne(String count);

  /// No description provided for @detailsOrdersOther.
  ///
  /// In en, this message translates to:
  /// **'Orders count'**
  String detailsOrdersOther(String count);

  /// No description provided for @detailsAnOverviewOfCustomerOrders.
  ///
  /// In en, this message translates to:
  /// **'An overview of Customer Orders'**
  String get detailsAnOverviewOfCustomerOrders;

  /// No description provided for @detailsRawCustomer.
  ///
  /// In en, this message translates to:
  /// **'Raw customer'**
  String get detailsRawCustomer;

  /// No description provided for @groupsGroupUpdated.
  ///
  /// In en, this message translates to:
  /// **'Group Updated'**
  String get groupsGroupUpdated;

  /// No description provided for @groupsGroupCreated.
  ///
  /// In en, this message translates to:
  /// **'Group Created'**
  String get groupsGroupCreated;

  /// No description provided for @groupsTheCustomerGroupHasBeenUpdated.
  ///
  /// In en, this message translates to:
  /// **'The customer group has been updated'**
  String get groupsTheCustomerGroupHasBeenUpdated;

  /// No description provided for @groupsTheCustomerGroupHasBeenCreated.
  ///
  /// In en, this message translates to:
  /// **'The customer group has been created'**
  String get groupsTheCustomerGroupHasBeenCreated;

  /// No description provided for @groupsEditCustomerGroup.
  ///
  /// In en, this message translates to:
  /// **'Edit Customer Group'**
  String get groupsEditCustomerGroup;

  /// No description provided for @groupsCreateANewCustomerGroup.
  ///
  /// In en, this message translates to:
  /// **'Create a New Customer Group'**
  String get groupsCreateANewCustomerGroup;

  /// No description provided for @groupsDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get groupsDetails;

  /// No description provided for @groupsMetadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get groupsMetadata;

  /// No description provided for @groupsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get groupsCancel;

  /// No description provided for @groupsEditGroup.
  ///
  /// In en, this message translates to:
  /// **'Edit Group'**
  String get groupsEditGroup;

  /// No description provided for @groupsPublishGroup.
  ///
  /// In en, this message translates to:
  /// **'Publish Group'**
  String get groupsPublishGroup;

  /// No description provided for @groupsNoCustomersInThisGroupYet.
  ///
  /// In en, this message translates to:
  /// **'No customers in this group yet'**
  String get groupsNoCustomersInThisGroupYet;

  /// No description provided for @groupsCustomers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get groupsCustomers;

  /// No description provided for @groupsEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get groupsEdit;

  /// No description provided for @groupsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get groupsDelete;

  /// No description provided for @groupsYesDelete.
  ///
  /// In en, this message translates to:
  /// **'Yes, delete'**
  String get groupsYesDelete;

  /// No description provided for @groupsDeleteTheGroup.
  ///
  /// In en, this message translates to:
  /// **'Delete the group'**
  String get groupsDeleteTheGroup;

  /// No description provided for @groupsGroupDeleted.
  ///
  /// In en, this message translates to:
  /// **'Group deleted'**
  String get groupsGroupDeleted;

  /// No description provided for @groupsConfirmDeleteCustomerGroup.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this customer group?'**
  String get groupsConfirmDeleteCustomerGroup;

  /// No description provided for @groupsBackToCustomerGroups.
  ///
  /// In en, this message translates to:
  /// **'Back to customer groups'**
  String get groupsBackToCustomerGroups;

  /// No description provided for @groupsNewGroup.
  ///
  /// In en, this message translates to:
  /// **'New group'**
  String get groupsNewGroup;

  /// No description provided for @addConditionConditionsWereSuccessfullyAdded.
  ///
  /// In en, this message translates to:
  /// **'Conditions were successfully added'**
  String get addConditionConditionsWereSuccessfullyAdded;

  /// No description provided for @addConditionDiscountConditionsUpdated.
  ///
  /// In en, this message translates to:
  /// **'Discount conditions updated'**
  String get addConditionDiscountConditionsUpdated;

  /// No description provided for @addConditionUseConditionsMustBeUsedWithinAConditionsProvider.
  ///
  /// In en, this message translates to:
  /// **'useConditions must be used within a ConditionsProvider'**
  String get addConditionUseConditionsMustBeUsedWithinAConditionsProvider;

  /// No description provided for @collectionsSearch.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get collectionsSearch;

  /// No description provided for @collectionsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get collectionsCancel;

  /// No description provided for @collectionsSaveAndGoBack.
  ///
  /// In en, this message translates to:
  /// **'Save and go back'**
  String get collectionsSaveAndGoBack;

  /// No description provided for @collectionsSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get collectionsSaveAndClose;

  /// No description provided for @customerGroupsSearch.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get customerGroupsSearch;

  /// No description provided for @customerGroupsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get customerGroupsCancel;

  /// No description provided for @customerGroupsSaveAndGoBack.
  ///
  /// In en, this message translates to:
  /// **'Save and go back'**
  String get customerGroupsSaveAndGoBack;

  /// No description provided for @customerGroupsSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get customerGroupsSaveAndClose;

  /// No description provided for @productTypesSearch.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get productTypesSearch;

  /// No description provided for @productTypesCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get productTypesCancel;

  /// No description provided for @productTypesSaveAndGoBack.
  ///
  /// In en, this message translates to:
  /// **'Save and go back'**
  String get productTypesSaveAndGoBack;

  /// No description provided for @productTypesSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get productTypesSaveAndClose;

  /// No description provided for @productsSearch.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get productsSearch;

  /// No description provided for @productsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get productsCancel;

  /// No description provided for @productsSaveAndGoBack.
  ///
  /// In en, this message translates to:
  /// **'Save and go back'**
  String get productsSaveAndGoBack;

  /// No description provided for @productsSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get productsSaveAndClose;

  /// No description provided for @tagsSearch.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get tagsSearch;

  /// No description provided for @tagsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get tagsCancel;

  /// No description provided for @tagsSaveAndGoBack.
  ///
  /// In en, this message translates to:
  /// **'Save and go back'**
  String get tagsSaveAndGoBack;

  /// No description provided for @tagsSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get tagsSaveAndClose;

  /// No description provided for @editConditionAddConditions.
  ///
  /// In en, this message translates to:
  /// **'Add conditions'**
  String get editConditionAddConditions;

  /// No description provided for @editConditionSelectedWithCountOne.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String editConditionSelectedWithCountOne(String count);

  /// No description provided for @editConditionSelectedWithCountOther.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String editConditionSelectedWithCountOther(String count);

  /// No description provided for @editConditionDeselect.
  ///
  /// In en, this message translates to:
  /// **'Deselect'**
  String get editConditionDeselect;

  /// No description provided for @editConditionRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get editConditionRemove;

  /// No description provided for @editConditionAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get editConditionAdd;

  /// No description provided for @editConditionTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit {type} in Discount Condition'**
  String editConditionTitle(String type);

  /// No description provided for @editConditionClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get editConditionClose;

  /// No description provided for @editConditionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get editConditionSuccess;

  /// No description provided for @editConditionTheResourcesWereSuccessfullyAdded.
  ///
  /// In en, this message translates to:
  /// **'The resources were successfully added'**
  String get editConditionTheResourcesWereSuccessfullyAdded;

  /// No description provided for @editConditionError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get editConditionError;

  /// No description provided for @editConditionFailedToAddResources.
  ///
  /// In en, this message translates to:
  /// **'Failed to add resources'**
  String get editConditionFailedToAddResources;

  /// No description provided for @editConditionTheResourcesWereSuccessfullyRemoved.
  ///
  /// In en, this message translates to:
  /// **'The resources were successfully removed'**
  String get editConditionTheResourcesWereSuccessfullyRemoved;

  /// No description provided for @editConditionFailedToRemoveResources.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove resources'**
  String get editConditionFailedToRemoveResources;

  /// No description provided for @editConditionUseEditConditionContextMustBeUsedWithinAnEditConditionProvider.
  ///
  /// In en, this message translates to:
  /// **'useEditConditionContext must be used within an EditConditionProvider'**
  String
      get editConditionUseEditConditionContextMustBeUsedWithinAnEditConditionProvider;

  /// No description provided for @conditionsConditions.
  ///
  /// In en, this message translates to:
  /// **'Conditions'**
  String get conditionsConditions;

  /// No description provided for @conditionsAddConditionLabel.
  ///
  /// In en, this message translates to:
  /// **'Add condition'**
  String get conditionsAddConditionLabel;

  /// No description provided for @conditionsThisDiscountHasNoConditions.
  ///
  /// In en, this message translates to:
  /// **'This discount has no conditions'**
  String get conditionsThisDiscountHasNoConditions;

  /// No description provided for @conditionsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get conditionsSuccess;

  /// No description provided for @conditionsConditionRemoved.
  ///
  /// In en, this message translates to:
  /// **'Condition removed'**
  String get conditionsConditionRemoved;

  /// No description provided for @conditionsError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get conditionsError;

  /// No description provided for @conditionsEditCondition.
  ///
  /// In en, this message translates to:
  /// **'Edit condition'**
  String get conditionsEditCondition;

  /// No description provided for @conditionsDeleteCondition.
  ///
  /// In en, this message translates to:
  /// **'Delete condition'**
  String get conditionsDeleteCondition;

  /// No description provided for @conditionsDiscountIsApplicableToSpecificProducts.
  ///
  /// In en, this message translates to:
  /// **'Discount is applicable to specific products'**
  String get conditionsDiscountIsApplicableToSpecificProducts;

  /// No description provided for @conditionsDiscountIsApplicableToSpecificCollections.
  ///
  /// In en, this message translates to:
  /// **'Discount is applicable to specific collections'**
  String get conditionsDiscountIsApplicableToSpecificCollections;

  /// No description provided for @conditionsDiscountIsApplicableToSpecificProductTags.
  ///
  /// In en, this message translates to:
  /// **'Discount is applicable to specific product tags'**
  String get conditionsDiscountIsApplicableToSpecificProductTags;

  /// No description provided for @conditionsDiscountIsApplicableToSpecificProductTypes.
  ///
  /// In en, this message translates to:
  /// **'Discount is applicable to specific product types'**
  String get conditionsDiscountIsApplicableToSpecificProductTypes;

  /// No description provided for @conditionsDiscountIsApplicableToSpecificCustomerGroups.
  ///
  /// In en, this message translates to:
  /// **'Discount is applicable to specific customer groups'**
  String get conditionsDiscountIsApplicableToSpecificCustomerGroups;

  /// No description provided for @configurationsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get configurationsSuccess;

  /// No description provided for @configurationsDiscountUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Discount updated successfully'**
  String get configurationsDiscountUpdatedSuccessfully;

  /// No description provided for @configurationsError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get configurationsError;

  /// No description provided for @configurationsEditConfigurations.
  ///
  /// In en, this message translates to:
  /// **'Edit configurations'**
  String get configurationsEditConfigurations;

  /// No description provided for @configurationsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get configurationsCancel;

  /// No description provided for @configurationsSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get configurationsSave;

  /// No description provided for @configurationsConfigurations.
  ///
  /// In en, this message translates to:
  /// **'Configurations'**
  String get configurationsConfigurations;

  /// No description provided for @configurationsStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get configurationsStartDate;

  /// No description provided for @configurationsEndDate.
  ///
  /// In en, this message translates to:
  /// **'End date'**
  String get configurationsEndDate;

  /// No description provided for @configurationsDeleteConfiguration.
  ///
  /// In en, this message translates to:
  /// **'Delete configuration'**
  String get configurationsDeleteConfiguration;

  /// No description provided for @configurationsDiscountEndDateRemoved.
  ///
  /// In en, this message translates to:
  /// **'Discount end date removed'**
  String get configurationsDiscountEndDateRemoved;

  /// No description provided for @configurationsNumberOfRedemptions.
  ///
  /// In en, this message translates to:
  /// **'Number of redemptions'**
  String get configurationsNumberOfRedemptions;

  /// No description provided for @configurationsRedemptionLimitRemoved.
  ///
  /// In en, this message translates to:
  /// **'Redemption limit removed'**
  String get configurationsRedemptionLimitRemoved;

  /// No description provided for @configurationsDeleteSetting.
  ///
  /// In en, this message translates to:
  /// **'Delete setting'**
  String get configurationsDeleteSetting;

  /// No description provided for @configurationsDiscountDurationRemoved.
  ///
  /// In en, this message translates to:
  /// **'Discount duration removed'**
  String get configurationsDiscountDurationRemoved;

  /// No description provided for @generalSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get generalSuccess;

  /// No description provided for @generalDiscountUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Discount updated successfully'**
  String get generalDiscountUpdatedSuccessfully;

  /// No description provided for @generalError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get generalError;

  /// No description provided for @generalEditGeneralInformation.
  ///
  /// In en, this message translates to:
  /// **'Edit general information'**
  String get generalEditGeneralInformation;

  /// No description provided for @generalDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get generalDetails;

  /// No description provided for @generalMetadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get generalMetadata;

  /// No description provided for @generalCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get generalCancel;

  /// No description provided for @generalSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get generalSaveAndClose;

  /// No description provided for @generalDeletePromotion.
  ///
  /// In en, this message translates to:
  /// **'Delete Promotion'**
  String get generalDeletePromotion;

  /// No description provided for @generalConfirmDeletePromotion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this promotion?'**
  String get generalConfirmDeletePromotion;

  /// No description provided for @generalPromotionDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Promotion deleted successfully'**
  String get generalPromotionDeletedSuccessfully;

  /// No description provided for @generalDiscountPublishedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Discount published successfully'**
  String get generalDiscountPublishedSuccessfully;

  /// No description provided for @generalDiscountDraftedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Discount drafted successfully'**
  String get generalDiscountDraftedSuccessfully;

  /// No description provided for @generalDeleteDiscount.
  ///
  /// In en, this message translates to:
  /// **'Delete discount'**
  String get generalDeleteDiscount;

  /// No description provided for @generalTemplateDiscount.
  ///
  /// In en, this message translates to:
  /// **'Template discount'**
  String get generalTemplateDiscount;

  /// No description provided for @generalPublished.
  ///
  /// In en, this message translates to:
  /// **'Published'**
  String get generalPublished;

  /// No description provided for @generalDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get generalDraft;

  /// No description provided for @generalDiscountAmount.
  ///
  /// In en, this message translates to:
  /// **'Discount Amount'**
  String get generalDiscountAmount;

  /// No description provided for @generalValidRegions.
  ///
  /// In en, this message translates to:
  /// **'Valid Regions'**
  String get generalValidRegions;

  /// No description provided for @generalTotalRedemptions.
  ///
  /// In en, this message translates to:
  /// **'Total Redemptions'**
  String get generalTotalRedemptions;

  /// No description provided for @generalFreeShipping.
  ///
  /// In en, this message translates to:
  /// **'FREE SHIPPING'**
  String get generalFreeShipping;

  /// No description provided for @generalUnknownDiscountType.
  ///
  /// In en, this message translates to:
  /// **'Unknown discount type'**
  String get generalUnknownDiscountType;

  /// No description provided for @detailsDiscountDeleted.
  ///
  /// In en, this message translates to:
  /// **'Discount deleted'**
  String get detailsDiscountDeleted;

  /// No description provided for @detailsConfirmDeleteDiscount.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this discount?'**
  String get detailsConfirmDeleteDiscount;

  /// No description provided for @detailsDeleteDiscount.
  ///
  /// In en, this message translates to:
  /// **'Delete discount'**
  String get detailsDeleteDiscount;

  /// No description provided for @detailsBackToDiscounts.
  ///
  /// In en, this message translates to:
  /// **'Back to Discounts'**
  String get detailsBackToDiscounts;

  /// No description provided for @detailsRawDiscount.
  ///
  /// In en, this message translates to:
  /// **'Raw discount'**
  String get detailsRawDiscount;

  /// No description provided for @discountsAddDiscount.
  ///
  /// In en, this message translates to:
  /// **'Add Discount'**
  String get discountsAddDiscount;

  /// No description provided for @discountFormAddConditions.
  ///
  /// In en, this message translates to:
  /// **'Add Conditions'**
  String get discountFormAddConditions;

  /// No description provided for @discountFormChooseAConditionType.
  ///
  /// In en, this message translates to:
  /// **'Choose a condition type'**
  String get discountFormChooseAConditionType;

  /// No description provided for @discountFormYouCanOnlyAddOneOfEachTypeOfCondition.
  ///
  /// In en, this message translates to:
  /// **'You can only add one of each type of condition'**
  String get discountFormYouCanOnlyAddOneOfEachTypeOfCondition;

  /// No description provided for @discountFormYouCannotAddAnyMoreConditions.
  ///
  /// In en, this message translates to:
  /// **'You cannot add any more conditions'**
  String get discountFormYouCannotAddAnyMoreConditions;

  /// No description provided for @discountFormCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get discountFormCancel;

  /// No description provided for @discountFormSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get discountFormSave;

  /// No description provided for @addConditionTablesCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get addConditionTablesCancel;

  /// No description provided for @addConditionTablesSaveAndAddMore.
  ///
  /// In en, this message translates to:
  /// **'Save and add more'**
  String get addConditionTablesSaveAndAddMore;

  /// No description provided for @addConditionTablesSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get addConditionTablesSaveAndClose;

  /// No description provided for @addConditionTablesSearchByTitle.
  ///
  /// In en, this message translates to:
  /// **'Search by title...'**
  String get addConditionTablesSearchByTitle;

  /// No description provided for @addConditionTablesSearchGroups.
  ///
  /// In en, this message translates to:
  /// **'Search groups...'**
  String get addConditionTablesSearchGroups;

  /// No description provided for @addConditionTablesSearchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get addConditionTablesSearchProducts;

  /// No description provided for @addConditionTablesSearchByTag.
  ///
  /// In en, this message translates to:
  /// **'Search by tag...'**
  String get addConditionTablesSearchByTag;

  /// No description provided for @addConditionTablesSearchByType.
  ///
  /// In en, this message translates to:
  /// **'Search by type...'**
  String get addConditionTablesSearchByType;

  /// No description provided for @detailsConditionTablesSearchByTitle.
  ///
  /// In en, this message translates to:
  /// **'Search by title...'**
  String get detailsConditionTablesSearchByTitle;

  /// No description provided for @detailsConditionTablesSearchGroups.
  ///
  /// In en, this message translates to:
  /// **'Search groups...'**
  String get detailsConditionTablesSearchGroups;

  /// No description provided for @detailsConditionTablesCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get detailsConditionTablesCancel;

  /// No description provided for @detailsConditionTablesSaveAndAddMore.
  ///
  /// In en, this message translates to:
  /// **'Save and add more'**
  String get detailsConditionTablesSaveAndAddMore;

  /// No description provided for @detailsConditionTablesSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get detailsConditionTablesSaveAndClose;

  /// No description provided for @detailsConditionTablesSearchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get detailsConditionTablesSearchProducts;

  /// No description provided for @detailsConditionTablesSearchByTag.
  ///
  /// In en, this message translates to:
  /// **'Search by tag...'**
  String get detailsConditionTablesSearchByTag;

  /// No description provided for @detailsConditionTablesSearchByType.
  ///
  /// In en, this message translates to:
  /// **'Search by type...'**
  String get detailsConditionTablesSearchByType;

  /// No description provided for @editConditionTablesSearchByTitle.
  ///
  /// In en, this message translates to:
  /// **'Search by title...'**
  String get editConditionTablesSearchByTitle;

  /// No description provided for @editConditionTablesTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get editConditionTablesTitle;

  /// No description provided for @editConditionTablesSearchGroups.
  ///
  /// In en, this message translates to:
  /// **'Search groups...'**
  String get editConditionTablesSearchGroups;

  /// No description provided for @editConditionTablesCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get editConditionTablesCancel;

  /// No description provided for @editConditionTablesDeleteCondition.
  ///
  /// In en, this message translates to:
  /// **'Delete condition'**
  String get editConditionTablesDeleteCondition;

  /// No description provided for @editConditionTablesSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get editConditionTablesSave;

  /// No description provided for @editConditionTablesSearchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get editConditionTablesSearchProducts;

  /// No description provided for @editConditionTablesSearchByTag.
  ///
  /// In en, this message translates to:
  /// **'Search by tag...'**
  String get editConditionTablesSearchByTag;

  /// No description provided for @editConditionTablesSearchByType.
  ///
  /// In en, this message translates to:
  /// **'Search by type...'**
  String get editConditionTablesSearchByType;

  /// No description provided for @sharedTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get sharedTitle;

  /// No description provided for @sharedProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get sharedProducts;

  /// No description provided for @sharedAppliesToTheSelectedItems.
  ///
  /// In en, this message translates to:
  /// **'Applies to the selected items.'**
  String get sharedAppliesToTheSelectedItems;

  /// No description provided for @sharedAppliesToAllItemsExceptTheSelectedItems.
  ///
  /// In en, this message translates to:
  /// **'Applies to all items except the selected items.'**
  String get sharedAppliesToAllItemsExceptTheSelectedItems;

  /// No description provided for @sharedMembers.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get sharedMembers;

  /// No description provided for @sharedStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get sharedStatus;

  /// No description provided for @sharedVariants.
  ///
  /// In en, this message translates to:
  /// **'Variants'**
  String get sharedVariants;

  /// No description provided for @sharedTag.
  ///
  /// In en, this message translates to:
  /// **'Tag'**
  String get sharedTag;

  /// No description provided for @sharedType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get sharedType;

  /// No description provided for @editConditionsModalTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit {title}'**
  String editConditionsModalTitle(String title);

  /// No description provided for @formUseDiscountFormMustBeAChildOfDiscountFormContext.
  ///
  /// In en, this message translates to:
  /// **'useDiscountForm must be a child of DiscountFormContext'**
  String get formUseDiscountFormMustBeAChildOfDiscountFormContext;

  /// No description provided for @discountFormError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get discountFormError;

  /// No description provided for @discountFormSaveAsDraft.
  ///
  /// In en, this message translates to:
  /// **'Save as draft'**
  String get discountFormSaveAsDraft;

  /// No description provided for @discountFormPublishDiscount.
  ///
  /// In en, this message translates to:
  /// **'Publish discount'**
  String get discountFormPublishDiscount;

  /// No description provided for @discountFormCreateNewDiscount.
  ///
  /// In en, this message translates to:
  /// **'Create new discount'**
  String get discountFormCreateNewDiscount;

  /// No description provided for @discountFormDiscountType.
  ///
  /// In en, this message translates to:
  /// **'Discount type'**
  String get discountFormDiscountType;

  /// No description provided for @discountFormSelectADiscountType.
  ///
  /// In en, this message translates to:
  /// **'Select a discount type'**
  String get discountFormSelectADiscountType;

  /// No description provided for @discountFormAllocation.
  ///
  /// In en, this message translates to:
  /// **'Allocation'**
  String get discountFormAllocation;

  /// No description provided for @discountFormGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get discountFormGeneral;

  /// No description provided for @discountFormConfiguration.
  ///
  /// In en, this message translates to:
  /// **'Configuration'**
  String get discountFormConfiguration;

  /// No description provided for @discountFormDiscountCodeApplicationDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Discount code applies from when you hit the publish button and forever if left untouched.'**
  String get discountFormDiscountCodeApplicationDisclaimer;

  /// No description provided for @discountFormConditions.
  ///
  /// In en, this message translates to:
  /// **'Conditions'**
  String get discountFormConditions;

  /// No description provided for @discountFormDiscountCodeApplyToAllProductsIfLeftUntouched.
  ///
  /// In en, this message translates to:
  /// **'Discount code apply to all products if left untouched.'**
  String get discountFormDiscountCodeApplyToAllProductsIfLeftUntouched;

  /// No description provided for @discountFormAddConditionsToYourDiscount.
  ///
  /// In en, this message translates to:
  /// **'Add conditions to your Discount'**
  String get discountFormAddConditionsToYourDiscount;

  /// No description provided for @discountFormMetadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get discountFormMetadata;

  /// No description provided for @discountFormMetadataUsageDescription.
  ///
  /// In en, this message translates to:
  /// **'Metadata allows you to add additional information to your discount.'**
  String get discountFormMetadataUsageDescription;

  /// No description provided for @conditionItemRemainderMore.
  ///
  /// In en, this message translates to:
  /// **'+remainder more'**
  String conditionItemRemainderMore(String remainder);

  /// No description provided for @conditionsEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get conditionsEdit;

  /// No description provided for @conditionsProduct.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get conditionsProduct;

  /// No description provided for @conditionsCollection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get conditionsCollection;

  /// No description provided for @conditionsTag.
  ///
  /// In en, this message translates to:
  /// **'Tag'**
  String get conditionsTag;

  /// No description provided for @conditionsCustomerGroup.
  ///
  /// In en, this message translates to:
  /// **'Customer group'**
  String get conditionsCustomerGroup;

  /// No description provided for @conditionsType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get conditionsType;

  /// No description provided for @conditionsAddCondition.
  ///
  /// In en, this message translates to:
  /// **'Add Condition'**
  String get conditionsAddCondition;

  /// No description provided for @sectionsStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get sectionsStartDate;

  /// No description provided for @sectionsScheduleTheDiscountToActivateInTheFuture.
  ///
  /// In en, this message translates to:
  /// **'Schedule the discount to activate in the future.'**
  String get sectionsScheduleTheDiscountToActivateInTheFuture;

  /// No description provided for @sectionsSelectDiscountStartDate.
  ///
  /// In en, this message translates to:
  /// **'If you want to schedule the discount to activate in the future, you can set a start date here, otherwise the discount will be active immediately.'**
  String get sectionsSelectDiscountStartDate;

  /// No description provided for @sectionsStartTime.
  ///
  /// In en, this message translates to:
  /// **'Start time'**
  String get sectionsStartTime;

  /// No description provided for @sectionsDiscountHasAnExpiryDate.
  ///
  /// In en, this message translates to:
  /// **'Discount has an expiry date?'**
  String get sectionsDiscountHasAnExpiryDate;

  /// No description provided for @sectionsScheduleTheDiscountToDeactivateInTheFuture.
  ///
  /// In en, this message translates to:
  /// **'Schedule the discount to deactivate in the future.'**
  String get sectionsScheduleTheDiscountToDeactivateInTheFuture;

  /// No description provided for @sectionsSelectDiscountEndDate.
  ///
  /// In en, this message translates to:
  /// **'If you want to schedule the discount to deactivate in the future, you can set an expiry date here.'**
  String get sectionsSelectDiscountEndDate;

  /// No description provided for @sectionsExpiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry date'**
  String get sectionsExpiryDate;

  /// No description provided for @sectionsExpiryTime.
  ///
  /// In en, this message translates to:
  /// **'Expiry time'**
  String get sectionsExpiryTime;

  /// No description provided for @sectionsLimitTheNumberOfRedemptions.
  ///
  /// In en, this message translates to:
  /// **'Limit the number of redemptions?'**
  String get sectionsLimitTheNumberOfRedemptions;

  /// No description provided for @sectionsLimitAppliesAcrossAllCustomersNotPerCustomer.
  ///
  /// In en, this message translates to:
  /// **'Limit applies across all customers, not per customer.'**
  String get sectionsLimitAppliesAcrossAllCustomersNotPerCustomer;

  /// No description provided for @sectionsLimitDiscountNumberOfUses.
  ///
  /// In en, this message translates to:
  /// **'If you wish to limit the amount of times a customer can redeem this discount, you can set a limit here.'**
  String get sectionsLimitDiscountNumberOfUses;

  /// No description provided for @sectionsNumberOfRedemptions.
  ///
  /// In en, this message translates to:
  /// **'Number of redemptions'**
  String get sectionsNumberOfRedemptions;

  /// No description provided for @sectionsAvailabilityDuration.
  ///
  /// In en, this message translates to:
  /// **'Availability duration?'**
  String get sectionsAvailabilityDuration;

  /// No description provided for @sectionsSetTheDurationOfTheDiscount.
  ///
  /// In en, this message translates to:
  /// **'Set the duration of the discount.'**
  String get sectionsSetTheDurationOfTheDiscount;

  /// No description provided for @sectionsSelectADiscountType.
  ///
  /// In en, this message translates to:
  /// **'Select a discount type'**
  String get sectionsSelectADiscountType;

  /// No description provided for @sectionsTotalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total amount'**
  String get sectionsTotalAmount;

  /// No description provided for @sectionsApplyToTheTotalAmount.
  ///
  /// In en, this message translates to:
  /// **'Apply to the total amount'**
  String get sectionsApplyToTheTotalAmount;

  /// No description provided for @sectionsItemSpecific.
  ///
  /// In en, this message translates to:
  /// **'Item specific'**
  String get sectionsItemSpecific;

  /// No description provided for @sectionsApplyToEveryAllowedItem.
  ///
  /// In en, this message translates to:
  /// **'Apply to every allowed item'**
  String get sectionsApplyToEveryAllowedItem;

  /// No description provided for @sectionsPercentage.
  ///
  /// In en, this message translates to:
  /// **'Percentage'**
  String get sectionsPercentage;

  /// No description provided for @sectionsFixedAmount.
  ///
  /// In en, this message translates to:
  /// **'Fixed amount'**
  String get sectionsFixedAmount;

  /// No description provided for @sectionsDiscountInWholeNumbers.
  ///
  /// In en, this message translates to:
  /// **'Discount in whole numbers'**
  String get sectionsDiscountInWholeNumbers;

  /// No description provided for @sectionsYouCanOnlySelectOneValidRegionIfYouWantToUseTheFixedAmountType.
  ///
  /// In en, this message translates to:
  /// **'You can only select one valid region if you want to use the fixed amount type'**
  String
      get sectionsYouCanOnlySelectOneValidRegionIfYouWantToUseTheFixedAmountType;

  /// No description provided for @sectionsFreeShipping.
  ///
  /// In en, this message translates to:
  /// **'Free shipping'**
  String get sectionsFreeShipping;

  /// No description provided for @sectionsOverrideDeliveryAmount.
  ///
  /// In en, this message translates to:
  /// **'Override delivery amount'**
  String get sectionsOverrideDeliveryAmount;

  /// No description provided for @sectionsAtLeastOneRegionIsRequired.
  ///
  /// In en, this message translates to:
  /// **'At least one region is required'**
  String get sectionsAtLeastOneRegionIsRequired;

  /// No description provided for @sectionsChooseValidRegions.
  ///
  /// In en, this message translates to:
  /// **'Choose valid regions'**
  String get sectionsChooseValidRegions;

  /// No description provided for @sectionsCode.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get sectionsCode;

  /// No description provided for @sectionsSummersale10.
  ///
  /// In en, this message translates to:
  /// **'SUMMERSALE10'**
  String get sectionsSummersale10;

  /// No description provided for @sectionsCodeIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Code is required'**
  String get sectionsCodeIsRequired;

  /// No description provided for @sectionsAmountIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Amount is required'**
  String get sectionsAmountIsRequired;

  /// No description provided for @sectionsAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get sectionsAmount;

  /// No description provided for @sectionsCustomerInvoiceCode.
  ///
  /// In en, this message translates to:
  /// **'The code your customers will enter during checkout. This will appear on your customer’s invoice.'**
  String get sectionsCustomerInvoiceCode;

  /// No description provided for @sectionsUppercaseLettersAndNumbersOnly.
  ///
  /// In en, this message translates to:
  /// **'Uppercase letters and numbers only.'**
  String get sectionsUppercaseLettersAndNumbersOnly;

  /// No description provided for @sectionsDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get sectionsDescription;

  /// No description provided for @sectionsSummerSale2022.
  ///
  /// In en, this message translates to:
  /// **'Summer Sale 2022'**
  String get sectionsSummerSale2022;

  /// No description provided for @sectionsThisIsATemplateDiscount.
  ///
  /// In en, this message translates to:
  /// **'This is a template discount'**
  String get sectionsThisIsATemplateDiscount;

  /// No description provided for @sectionsTemplateDiscountsDescription.
  ///
  /// In en, this message translates to:
  /// **'Template discounts allow you to define a set of rules that can be used across a group of discounts. This is useful in campaigns that should generate unique codes for each user, but where the rules for all unique codes should be the same.'**
  String get sectionsTemplateDiscountsDescription;

  /// No description provided for @discountFormProduct.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get discountFormProduct;

  /// No description provided for @discountFormOnlyForSpecificProducts.
  ///
  /// In en, this message translates to:
  /// **'Only for specific products'**
  String get discountFormOnlyForSpecificProducts;

  /// No description provided for @discountFormChooseProducts.
  ///
  /// In en, this message translates to:
  /// **'Choose products'**
  String get discountFormChooseProducts;

  /// No description provided for @discountFormCustomerGroup.
  ///
  /// In en, this message translates to:
  /// **'Customer group'**
  String get discountFormCustomerGroup;

  /// No description provided for @discountFormOnlyForSpecificCustomerGroups.
  ///
  /// In en, this message translates to:
  /// **'Only for specific customer groups'**
  String get discountFormOnlyForSpecificCustomerGroups;

  /// No description provided for @discountFormChooseGroups.
  ///
  /// In en, this message translates to:
  /// **'Choose groups'**
  String get discountFormChooseGroups;

  /// No description provided for @discountFormTag.
  ///
  /// In en, this message translates to:
  /// **'Tag'**
  String get discountFormTag;

  /// No description provided for @discountFormOnlyForSpecificTags.
  ///
  /// In en, this message translates to:
  /// **'Only for specific tags'**
  String get discountFormOnlyForSpecificTags;

  /// No description provided for @discountFormCollection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get discountFormCollection;

  /// No description provided for @discountFormOnlyForSpecificProductCollections.
  ///
  /// In en, this message translates to:
  /// **'Only for specific product collections'**
  String get discountFormOnlyForSpecificProductCollections;

  /// No description provided for @discountFormChooseCollections.
  ///
  /// In en, this message translates to:
  /// **'Choose collections'**
  String get discountFormChooseCollections;

  /// No description provided for @discountFormType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get discountFormType;

  /// No description provided for @discountFormOnlyForSpecificProductTypes.
  ///
  /// In en, this message translates to:
  /// **'Only for specific product types'**
  String get discountFormOnlyForSpecificProductTypes;

  /// No description provided for @discountFormChooseTypes.
  ///
  /// In en, this message translates to:
  /// **'Choose types'**
  String get discountFormChooseTypes;

  /// No description provided for @utilsProducts.
  ///
  /// In en, this message translates to:
  /// **'products'**
  String get utilsProducts;

  /// No description provided for @utilsGroups.
  ///
  /// In en, this message translates to:
  /// **'groups'**
  String get utilsGroups;

  /// No description provided for @utilsTags.
  ///
  /// In en, this message translates to:
  /// **'tags'**
  String get utilsTags;

  /// No description provided for @utilsCollections.
  ///
  /// In en, this message translates to:
  /// **'collections'**
  String get utilsCollections;

  /// No description provided for @utilsTypes.
  ///
  /// In en, this message translates to:
  /// **'types'**
  String get utilsTypes;

  /// No description provided for @giftCardsCreatedGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Created gift card'**
  String get giftCardsCreatedGiftCard;

  /// No description provided for @giftCardsCustomGiftCardWasCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Custom gift card was created successfully'**
  String get giftCardsCustomGiftCardWasCreatedSuccessfully;

  /// No description provided for @giftCardsError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get giftCardsError;

  /// No description provided for @giftCardsCustomGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Custom Gift Card'**
  String get giftCardsCustomGiftCard;

  /// No description provided for @giftCardsDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get giftCardsDetails;

  /// No description provided for @giftCardsReceiver.
  ///
  /// In en, this message translates to:
  /// **'Receiver'**
  String get giftCardsReceiver;

  /// No description provided for @giftCardsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get giftCardsCancel;

  /// No description provided for @giftCardsCreateAndSend.
  ///
  /// In en, this message translates to:
  /// **'Create and send'**
  String get giftCardsCreateAndSend;

  /// No description provided for @detailsUpdatedGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Updated Gift card'**
  String get detailsUpdatedGiftCard;

  /// No description provided for @detailsGiftCardWasSuccessfullyUpdated.
  ///
  /// In en, this message translates to:
  /// **'Gift card was successfully updated'**
  String get detailsGiftCardWasSuccessfullyUpdated;

  /// No description provided for @detailsFailedToUpdateGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Failed to update Gift card'**
  String get detailsFailedToUpdateGiftCard;

  /// No description provided for @detailsEditGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Edit Gift Card'**
  String get detailsEditGiftCard;

  /// No description provided for @detailsDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get detailsDetails;

  /// No description provided for @detailsEditDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit details'**
  String get detailsEditDetails;

  /// No description provided for @detailsUpdateBalanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Update balance'**
  String get detailsUpdateBalanceLabel;

  /// No description provided for @detailsUpdatedStatus.
  ///
  /// In en, this message translates to:
  /// **'Updated status'**
  String get detailsUpdatedStatus;

  /// No description provided for @detailsSuccessfullyUpdatedTheStatusOfTheGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated the status of the Gift Card'**
  String get detailsSuccessfullyUpdatedTheStatusOfTheGiftCard;

  /// No description provided for @detailsBackToGiftCards.
  ///
  /// In en, this message translates to:
  /// **'Back to Gift Cards'**
  String get detailsBackToGiftCards;

  /// No description provided for @detailsOriginalAmount.
  ///
  /// In en, this message translates to:
  /// **'Original amount'**
  String get detailsOriginalAmount;

  /// No description provided for @detailsBalance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get detailsBalance;

  /// No description provided for @detailsRegion.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get detailsRegion;

  /// No description provided for @detailsExpiresOn.
  ///
  /// In en, this message translates to:
  /// **'Expires on'**
  String get detailsExpiresOn;

  /// No description provided for @detailsCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get detailsCreated;

  /// No description provided for @detailsRawGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Raw gift card'**
  String get detailsRawGiftCard;

  /// No description provided for @detailsBalanceUpdated.
  ///
  /// In en, this message translates to:
  /// **'Balance updated'**
  String get detailsBalanceUpdated;

  /// No description provided for @detailsGiftCardBalanceWasUpdated.
  ///
  /// In en, this message translates to:
  /// **'Gift card balance was updated'**
  String get detailsGiftCardBalanceWasUpdated;

  /// No description provided for @detailsFailedToUpdateBalance.
  ///
  /// In en, this message translates to:
  /// **'Failed to update balance'**
  String get detailsFailedToUpdateBalance;

  /// No description provided for @detailsUpdateBalance.
  ///
  /// In en, this message translates to:
  /// **'Update Balance'**
  String get detailsUpdateBalance;

  /// No description provided for @manageBackToGiftCards.
  ///
  /// In en, this message translates to:
  /// **'Back to Gift Cards'**
  String get manageBackToGiftCards;

  /// No description provided for @giftCardsPleaseEnterANameForTheGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Please enter a name for the Gift Card'**
  String get giftCardsPleaseEnterANameForTheGiftCard;

  /// No description provided for @giftCardsPleaseAddAtLeastOneDenomination.
  ///
  /// In en, this message translates to:
  /// **'Please add at least one denomination'**
  String get giftCardsPleaseAddAtLeastOneDenomination;

  /// No description provided for @giftCardsDenominations.
  ///
  /// In en, this message translates to:
  /// **'Denominations'**
  String get giftCardsDenominations;

  /// No description provided for @giftCardsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get giftCardsSuccess;

  /// No description provided for @giftCardsSuccessfullyCreatedGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Successfully created Gift Card'**
  String get giftCardsSuccessfullyCreatedGiftCard;

  /// No description provided for @giftCardsCreateGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Create Gift Card'**
  String get giftCardsCreateGiftCard;

  /// No description provided for @giftCardsGiftCardDetails.
  ///
  /// In en, this message translates to:
  /// **'Gift Card Details'**
  String get giftCardsGiftCardDetails;

  /// No description provided for @giftCardsName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get giftCardsName;

  /// No description provided for @giftCardsTheBestGiftCard.
  ///
  /// In en, this message translates to:
  /// **'The best Gift Card'**
  String get giftCardsTheBestGiftCard;

  /// No description provided for @giftCardsDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get giftCardsDescription;

  /// No description provided for @giftCardsTheBestGiftCardOfAllTime.
  ///
  /// In en, this message translates to:
  /// **'The best Gift Card of all time'**
  String get giftCardsTheBestGiftCardOfAllTime;

  /// No description provided for @giftCardsThumbnail.
  ///
  /// In en, this message translates to:
  /// **'Thumbnail'**
  String get giftCardsThumbnail;

  /// No description provided for @giftCardsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get giftCardsDelete;

  /// No description provided for @giftCardsSizeRecommended.
  ///
  /// In en, this message translates to:
  /// **'1200 x 1600 (3:4) recommended, up to 10MB each'**
  String get giftCardsSizeRecommended;

  /// No description provided for @giftCardsAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get giftCardsAmount;

  /// No description provided for @giftCardsAddDenomination.
  ///
  /// In en, this message translates to:
  /// **'Add Denomination'**
  String get giftCardsAddDenomination;

  /// No description provided for @giftCardsCreatePublish.
  ///
  /// In en, this message translates to:
  /// **'Create & Publish'**
  String get giftCardsCreatePublish;

  /// No description provided for @giftCardsSuccessfullyUpdatedGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated Gift Card'**
  String get giftCardsSuccessfullyUpdatedGiftCard;

  /// No description provided for @giftCardsGiftCards.
  ///
  /// In en, this message translates to:
  /// **'Gift Cards'**
  String get giftCardsGiftCards;

  /// No description provided for @giftCardsManage.
  ///
  /// In en, this message translates to:
  /// **'Manage the Gift Cards of your Medusa store'**
  String get giftCardsManage;

  /// No description provided for @giftCardsAreYouReadyToSellYourFirstGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Are you ready to sell your first Gift Card?'**
  String get giftCardsAreYouReadyToSellYourFirstGiftCard;

  /// No description provided for @giftCardsNoGiftCardHasBeenAddedYet.
  ///
  /// In en, this message translates to:
  /// **'No Gift Card has been added yet.'**
  String get giftCardsNoGiftCardHasBeenAddedYet;

  /// No description provided for @giftCardsHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get giftCardsHistory;

  /// No description provided for @giftCardsSeeTheHistoryOfPurchasedGiftCards.
  ///
  /// In en, this message translates to:
  /// **'See the history of purchased Gift Cards'**
  String get giftCardsSeeTheHistoryOfPurchasedGiftCards;

  /// No description provided for @giftCardsSuccessfullyDeletedGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Successfully deleted Gift Card'**
  String get giftCardsSuccessfullyDeletedGiftCard;

  /// No description provided for @giftCardsYesDelete.
  ///
  /// In en, this message translates to:
  /// **'Yes, delete'**
  String get giftCardsYesDelete;

  /// No description provided for @giftCardsDeleteGiftCard.
  ///
  /// In en, this message translates to:
  /// **'Delete Gift Card'**
  String get giftCardsDeleteGiftCard;

  /// No description provided for @inventoryFilters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get inventoryFilters;

  /// No description provided for @addressFormAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get addressFormAddress;

  /// No description provided for @addressFormCompany.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get addressFormCompany;

  /// No description provided for @addressFormAddress1.
  ///
  /// In en, this message translates to:
  /// **'Address 1'**
  String get addressFormAddress1;

  /// No description provided for @addressFormThisFieldIsRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get addressFormThisFieldIsRequired;

  /// No description provided for @addressFormAddress2.
  ///
  /// In en, this message translates to:
  /// **'Address 2'**
  String get addressFormAddress2;

  /// No description provided for @addressFormPostalCode.
  ///
  /// In en, this message translates to:
  /// **'Postal code'**
  String get addressFormPostalCode;

  /// No description provided for @addressFormCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get addressFormCity;

  /// No description provided for @addressFormCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get addressFormCountry;

  /// No description provided for @editSalesChannelsEditChannels.
  ///
  /// In en, this message translates to:
  /// **'Edit channels'**
  String get editSalesChannelsEditChannels;

  /// No description provided for @editSalesChannelsAddChannels.
  ///
  /// In en, this message translates to:
  /// **'Add channels'**
  String get editSalesChannelsAddChannels;

  /// No description provided for @generalFormLocationName.
  ///
  /// In en, this message translates to:
  /// **'Location name'**
  String get generalFormLocationName;

  /// No description provided for @generalFormFlagshipStoreWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Flagship store, warehouse'**
  String get generalFormFlagshipStoreWarehouse;

  /// No description provided for @generalFormNameIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get generalFormNameIsRequired;

  /// No description provided for @locationCardDeleteLocation.
  ///
  /// In en, this message translates to:
  /// **'Delete Location'**
  String get locationCardDeleteLocation;

  /// No description provided for @locationCardConfirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this location. This will also delete all inventory levels and reservations associated with this location.'**
  String get locationCardConfirmDelete;

  /// No description provided for @locationCardSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get locationCardSuccess;

  /// No description provided for @locationCardLocationDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Location deleted successfully'**
  String get locationCardLocationDeletedSuccessfully;

  /// No description provided for @locationCardError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get locationCardError;

  /// No description provided for @locationCardEditDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit details'**
  String get locationCardEditDetails;

  /// No description provided for @locationCardDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get locationCardDelete;

  /// No description provided for @locationCardConnectedSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Connected sales channels'**
  String get locationCardConnectedSalesChannels;

  /// No description provided for @salesChannelsFormAddSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Add sales channels'**
  String get salesChannelsFormAddSalesChannels;

  /// No description provided for @salesChannelsFormEditChannels.
  ///
  /// In en, this message translates to:
  /// **'Edit channels'**
  String get salesChannelsFormEditChannels;

  /// No description provided for @salesChannelsSectionNotConnectedToAnySalesChannelsYet.
  ///
  /// In en, this message translates to:
  /// **'Not connected to any sales channels yet'**
  String get salesChannelsSectionNotConnectedToAnySalesChannelsYet;

  /// No description provided for @editSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get editSuccess;

  /// No description provided for @editLocationEditedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Location edited successfully'**
  String get editLocationEditedSuccessfully;

  /// No description provided for @editError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get editError;

  /// No description provided for @editEditLocationDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit Location Details'**
  String get editEditLocationDetails;

  /// No description provided for @editMetadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get editMetadata;

  /// No description provided for @editCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get editCancel;

  /// No description provided for @editSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get editSaveAndClose;

  /// No description provided for @newLocationAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Location added successfully'**
  String get newLocationAddedSuccessfully;

  /// No description provided for @newLocationCreated.
  ///
  /// In en, this message translates to:
  /// **'Location was created successfully, but there was an error associating sales channels'**
  String get newLocationCreated;

  /// No description provided for @newCancelLocationChanges.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel with unsaved changes'**
  String get newCancelLocationChanges;

  /// No description provided for @newYesCancel.
  ///
  /// In en, this message translates to:
  /// **'Yes, cancel'**
  String get newYesCancel;

  /// No description provided for @newNoContinueCreating.
  ///
  /// In en, this message translates to:
  /// **'No, continue creating'**
  String get newNoContinueCreating;

  /// No description provided for @newAddLocation.
  ///
  /// In en, this message translates to:
  /// **'Add location'**
  String get newAddLocation;

  /// No description provided for @newAddNewLocation.
  ///
  /// In en, this message translates to:
  /// **'Add new location'**
  String get newAddNewLocation;

  /// No description provided for @newGeneralInformation.
  ///
  /// In en, this message translates to:
  /// **'General Information'**
  String get newGeneralInformation;

  /// No description provided for @newLocationDetails.
  ///
  /// In en, this message translates to:
  /// **'Specify the details about this location'**
  String get newLocationDetails;

  /// No description provided for @newSelectLocationChannel.
  ///
  /// In en, this message translates to:
  /// **'Specify which Sales Channels this location\'s items can be purchased through.'**
  String get newSelectLocationChannel;

  /// No description provided for @oauthCompleteInstallation.
  ///
  /// In en, this message translates to:
  /// **'Complete Installation'**
  String get oauthCompleteInstallation;

  /// No description provided for @claimTypeFormRefund.
  ///
  /// In en, this message translates to:
  /// **'Refund'**
  String get claimTypeFormRefund;

  /// No description provided for @claimTypeFormReplace.
  ///
  /// In en, this message translates to:
  /// **'Replace'**
  String get claimTypeFormReplace;

  /// No description provided for @itemsToReceiveFormItemsToReceive.
  ///
  /// In en, this message translates to:
  /// **'Items to receive'**
  String get itemsToReceiveFormItemsToReceive;

  /// No description provided for @itemsToReceiveFormProduct.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get itemsToReceiveFormProduct;

  /// No description provided for @itemsToReceiveFormQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get itemsToReceiveFormQuantity;

  /// No description provided for @itemsToReceiveFormRefundable.
  ///
  /// In en, this message translates to:
  /// **'Refundable'**
  String get itemsToReceiveFormRefundable;

  /// No description provided for @addReturnReasonReasonForReturn.
  ///
  /// In en, this message translates to:
  /// **'Reason for Return'**
  String get addReturnReasonReasonForReturn;

  /// No description provided for @addReturnReasonReason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get addReturnReasonReason;

  /// No description provided for @addReturnReasonChooseAReturnReason.
  ///
  /// In en, this message translates to:
  /// **'Choose a return reason'**
  String get addReturnReasonChooseAReturnReason;

  /// No description provided for @addReturnReasonNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get addReturnReasonNote;

  /// No description provided for @addReturnReasonProductWasDamagedDuringShipping.
  ///
  /// In en, this message translates to:
  /// **'Product was damaged during shipping'**
  String get addReturnReasonProductWasDamagedDuringShipping;

  /// No description provided for @addReturnReasonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get addReturnReasonCancel;

  /// No description provided for @addReturnReasonSaveAndGoBack.
  ///
  /// In en, this message translates to:
  /// **'Save and go back'**
  String get addReturnReasonSaveAndGoBack;

  /// No description provided for @addReturnReasonSelectReasonTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Reason'**
  String get addReturnReasonSelectReasonTitle;

  /// No description provided for @addReturnReasonEditReason.
  ///
  /// In en, this message translates to:
  /// **'Edit reason'**
  String get addReturnReasonEditReason;

  /// No description provided for @addReturnReasonSelectReason.
  ///
  /// In en, this message translates to:
  /// **'Select reason'**
  String get addReturnReasonSelectReason;

  /// No description provided for @itemsToReturnFormItemsToClaim.
  ///
  /// In en, this message translates to:
  /// **'Items to claim'**
  String get itemsToReturnFormItemsToClaim;

  /// No description provided for @itemsToReturnFormItemsToReturn.
  ///
  /// In en, this message translates to:
  /// **'Items to return'**
  String get itemsToReturnFormItemsToReturn;

  /// No description provided for @itemsToReturnFormProduct.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get itemsToReturnFormProduct;

  /// No description provided for @itemsToReturnFormQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get itemsToReturnFormQuantity;

  /// No description provided for @itemsToReturnFormRefundable.
  ///
  /// In en, this message translates to:
  /// **'Refundable'**
  String get itemsToReturnFormRefundable;

  /// No description provided for @addAdditionalItemsScreenGoBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get addAdditionalItemsScreenGoBack;

  /// No description provided for @addAdditionalItemsScreenAddProducts.
  ///
  /// In en, this message translates to:
  /// **'Add products'**
  String get addAdditionalItemsScreenAddProducts;

  /// No description provided for @addAdditionalItemsScreenAddProductVariants.
  ///
  /// In en, this message translates to:
  /// **'Add Product Variants'**
  String get addAdditionalItemsScreenAddProductVariants;

  /// No description provided for @addAdditionalItemsScreenSearchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products'**
  String get addAdditionalItemsScreenSearchProducts;

  /// No description provided for @addAdditionalItemsScreenVariantPriceMissing.
  ///
  /// In en, this message translates to:
  /// **'This variant does not have a price for the region/currency of this order, and cannot be selected.'**
  String get addAdditionalItemsScreenVariantPriceMissing;

  /// No description provided for @addAdditionalItemsScreenStock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get addAdditionalItemsScreenStock;

  /// No description provided for @addAdditionalItemsScreenPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get addAdditionalItemsScreenPrice;

  /// No description provided for @addAdditionalItemsScreenPriceOverriddenInPriceListApplicableToThisOrder.
  ///
  /// In en, this message translates to:
  /// **'The price has been overridden in a price list, that is applicable to this order.'**
  String
      get addAdditionalItemsScreenPriceOverriddenInPriceListApplicableToThisOrder;

  /// No description provided for @itemsToSendFormItemsToSend.
  ///
  /// In en, this message translates to:
  /// **'Items to send'**
  String get itemsToSendFormItemsToSend;

  /// No description provided for @itemsToSendFormAddProducts.
  ///
  /// In en, this message translates to:
  /// **'Add products'**
  String get itemsToSendFormAddProducts;

  /// No description provided for @itemsToSendFormProduct.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get itemsToSendFormProduct;

  /// No description provided for @itemsToSendFormQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get itemsToSendFormQuantity;

  /// No description provided for @itemsToSendFormPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get itemsToSendFormPrice;

  /// No description provided for @itemsToSendFormPriceOverriddenInPriceListApplicableToThisOrder.
  ///
  /// In en, this message translates to:
  /// **'The price has been overridden in a price list, that is applicable to this order.'**
  String get itemsToSendFormPriceOverriddenInPriceListApplicableToThisOrder;

  /// No description provided for @refundAmountFormCancelEditingRefundAmount.
  ///
  /// In en, this message translates to:
  /// **'Cancel editing refund amount'**
  String get refundAmountFormCancelEditingRefundAmount;

  /// No description provided for @refundAmountFormEditRefundAmount.
  ///
  /// In en, this message translates to:
  /// **'Edit refund amount'**
  String get refundAmountFormEditRefundAmount;

  /// No description provided for @refundAmountFormRefundAmountCannotBeNegative.
  ///
  /// In en, this message translates to:
  /// **'Refund amount cannot be negative'**
  String get refundAmountFormRefundAmountCannotBeNegative;

  /// No description provided for @refundAmountFormTheRefundAmountMustBeAtLeast0.
  ///
  /// In en, this message translates to:
  /// **'The refund amount must be at least 0'**
  String get refundAmountFormTheRefundAmountMustBeAtLeast0;

  /// No description provided for @reservationIndicatorAwaitingReservationCount.
  ///
  /// In en, this message translates to:
  /// **'{awaitingReservation} items not reserved'**
  String reservationIndicatorAwaitingReservationCount(
      String awaitingReservation);

  /// No description provided for @reservationIndicatorThisItemHasBeenFulfilled.
  ///
  /// In en, this message translates to:
  /// **'This item has been fulfilled.'**
  String get reservationIndicatorThisItemHasBeenFulfilled;

  /// No description provided for @editReservationButtonQuantityItemLocationName.
  ///
  /// In en, this message translates to:
  /// **'{quantity} item: '**
  String editReservationButtonQuantityItemLocationName(String quantity);

  /// No description provided for @reservationIndicatorEditReservation.
  ///
  /// In en, this message translates to:
  /// **'Edit reservation'**
  String get reservationIndicatorEditReservation;

  /// No description provided for @rmaSummariesClaimedItems.
  ///
  /// In en, this message translates to:
  /// **'Claimed items'**
  String get rmaSummariesClaimedItems;

  /// No description provided for @rmaSummariesReplacementItems.
  ///
  /// In en, this message translates to:
  /// **'Replacement items'**
  String get rmaSummariesReplacementItems;

  /// No description provided for @rmaSummariesCustomerRefundDescription.
  ///
  /// In en, this message translates to:
  /// **'The customer will receive a full refund for the claimed items, as the cost of replacement items and shipping will not be deducted. Alternatively, you can choose to set a custom refund amount when you receive the returned items or create an exchange instead.'**
  String get rmaSummariesCustomerRefundDescription;

  /// No description provided for @rmaSummariesRefundAmount.
  ///
  /// In en, this message translates to:
  /// **'Refund amount'**
  String get rmaSummariesRefundAmount;

  /// No description provided for @rmaSummariesTheCustomerWillBeRefundedOnceTheReturnedItemsAreReceived.
  ///
  /// In en, this message translates to:
  /// **'The customer will be refunded once the returned items are received'**
  String
      get rmaSummariesTheCustomerWillBeRefundedOnceTheReturnedItemsAreReceived;

  /// No description provided for @rmaSummariesTheCustomerWillBeRefundedImmediately.
  ///
  /// In en, this message translates to:
  /// **'The customer will be refunded immediately'**
  String get rmaSummariesTheCustomerWillBeRefundedImmediately;

  /// No description provided for @rmaSummariesReceiving.
  ///
  /// In en, this message translates to:
  /// **'Receiving'**
  String get rmaSummariesReceiving;

  /// No description provided for @rmaSummariesFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get rmaSummariesFree;

  /// No description provided for @sendNotificationFormReturn.
  ///
  /// In en, this message translates to:
  /// **'return'**
  String get sendNotificationFormReturn;

  /// No description provided for @sendNotificationFormExchange.
  ///
  /// In en, this message translates to:
  /// **'exchange'**
  String get sendNotificationFormExchange;

  /// No description provided for @sendNotificationFormClaim.
  ///
  /// In en, this message translates to:
  /// **'claim'**
  String get sendNotificationFormClaim;

  /// No description provided for @sendNotificationFormSendNotifications.
  ///
  /// In en, this message translates to:
  /// **'Send notifications'**
  String get sendNotificationFormSendNotifications;

  /// No description provided for @sendNotificationFormIfUncheckedTheCustomerWillNotReceiveCommunication.
  ///
  /// In en, this message translates to:
  /// **'If unchecked the customer will not receive communication about this subject.'**
  String
      get sendNotificationFormIfUncheckedTheCustomerWillNotReceiveCommunication;

  /// No description provided for @shippingAddressFormShippingAddress.
  ///
  /// In en, this message translates to:
  /// **'Shipping address'**
  String get shippingAddressFormShippingAddress;

  /// No description provided for @shippingAddressFormShipToADifferentAddress.
  ///
  /// In en, this message translates to:
  /// **'Ship to a different address'**
  String get shippingAddressFormShipToADifferentAddress;

  /// No description provided for @shippingAddressFormCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get shippingAddressFormCancel;

  /// No description provided for @shippingAddressFormSaveAndGoBack.
  ///
  /// In en, this message translates to:
  /// **'Save and go back'**
  String get shippingAddressFormSaveAndGoBack;

  /// No description provided for @shippingAddressFormShippingInformation.
  ///
  /// In en, this message translates to:
  /// **'Shipping Information'**
  String get shippingAddressFormShippingInformation;

  /// No description provided for @shippingFormShippingForReturnItems.
  ///
  /// In en, this message translates to:
  /// **'Shipping for return items'**
  String get shippingFormShippingForReturnItems;

  /// No description provided for @shippingFormShippingForReplacementItems.
  ///
  /// In en, this message translates to:
  /// **'Shipping for replacement items'**
  String get shippingFormShippingForReplacementItems;

  /// No description provided for @shippingFormShippingMethodIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Shipping method is required'**
  String get shippingFormShippingMethodIsRequired;

  /// No description provided for @shippingFormChooseShippingMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose shipping method'**
  String get shippingFormChooseShippingMethod;

  /// No description provided for @shippingFormShippingMethod.
  ///
  /// In en, this message translates to:
  /// **'Shipping method'**
  String get shippingFormShippingMethod;

  /// No description provided for @shippingFormAddCustomPrice.
  ///
  /// In en, this message translates to:
  /// **'Add custom price'**
  String get shippingFormAddCustomPrice;

  /// No description provided for @shippingFormReturnShippingForItemsClaimedByTheCustomerIsComplimentary.
  ///
  /// In en, this message translates to:
  /// **'Return shipping for items claimed by the customer is complimentary.'**
  String
      get shippingFormReturnShippingForItemsClaimedByTheCustomerIsComplimentary;

  /// No description provided for @shippingFormShippingForReplacementItemsIsComplimentary.
  ///
  /// In en, this message translates to:
  /// **'Shipping for replacement items is complimentary.'**
  String get shippingFormShippingForReplacementItemsIsComplimentary;

  /// No description provided for @componentsDecreaseQuantity.
  ///
  /// In en, this message translates to:
  /// **'Decrease quantity'**
  String get componentsDecreaseQuantity;

  /// No description provided for @componentsIncreaseQuantity.
  ///
  /// In en, this message translates to:
  /// **'Increase quantity'**
  String get componentsIncreaseQuantity;

  /// No description provided for @detailsSuccessfullyUpdatedAddress.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated address'**
  String get detailsSuccessfullyUpdatedAddress;

  /// No description provided for @detailsBillingAddress.
  ///
  /// In en, this message translates to:
  /// **'Billing Address'**
  String get detailsBillingAddress;

  /// No description provided for @detailsShippingAddress.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get detailsShippingAddress;

  /// No description provided for @detailsContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get detailsContact;

  /// No description provided for @detailsLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get detailsLocation;

  /// No description provided for @claimAreYouSureYouWantToClose.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to close?'**
  String get claimAreYouSureYouWantToClose;

  /// No description provided for @claimYouHaveUnsavedChangesAreYouSureYouWantToClose.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes, are you sure you want to close?'**
  String get claimYouHaveUnsavedChangesAreYouSureYouWantToClose;

  /// No description provided for @claimPleaseSelectAReason.
  ///
  /// In en, this message translates to:
  /// **'Please select a reason'**
  String get claimPleaseSelectAReason;

  /// No description provided for @claimAShippingMethodForReplacementItemsIsRequired.
  ///
  /// In en, this message translates to:
  /// **'A shipping method for replacement items is required'**
  String get claimAShippingMethodForReplacementItemsIsRequired;

  /// No description provided for @claimSuccessfullyCreatedClaim.
  ///
  /// In en, this message translates to:
  /// **'Successfully created claim'**
  String get claimSuccessfullyCreatedClaim;

  /// No description provided for @claimCreated.
  ///
  /// In en, this message translates to:
  /// **'A claim for order #{displayId} was successfully created'**
  String claimCreated(String displayId, Object display_id);

  /// No description provided for @claimErrorCreatingClaim.
  ///
  /// In en, this message translates to:
  /// **'Error creating claim'**
  String get claimErrorCreatingClaim;

  /// No description provided for @claimCreateClaim.
  ///
  /// In en, this message translates to:
  /// **'Create Claim'**
  String get claimCreateClaim;

  /// No description provided for @claimLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get claimLocation;

  /// No description provided for @claimChooseWhichLocationYouWantToReturnTheItemsTo.
  ///
  /// In en, this message translates to:
  /// **'Choose which location you want to return the items to.'**
  String get claimChooseWhichLocationYouWantToReturnTheItemsTo;

  /// No description provided for @claimSelectLocationToReturnTo.
  ///
  /// In en, this message translates to:
  /// **'Select Location to Return to'**
  String get claimSelectLocationToReturnTo;

  /// No description provided for @claimCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get claimCancel;

  /// No description provided for @claimSubmitAndClose.
  ///
  /// In en, this message translates to:
  /// **'Submit and close'**
  String get claimSubmitAndClose;

  /// No description provided for @createFulfillmentError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get createFulfillmentError;

  /// No description provided for @createFulfillmentPleaseSelectALocationToFulfillFrom.
  ///
  /// In en, this message translates to:
  /// **'Please select a location to fulfill from'**
  String get createFulfillmentPleaseSelectALocationToFulfillFrom;

  /// No description provided for @createFulfillmentCantAllowThisAction.
  ///
  /// In en, this message translates to:
  /// **'Can\'t allow this action'**
  String get createFulfillmentCantAllowThisAction;

  /// No description provided for @createFulfillmentTryingToFulfillMoreThanInStock.
  ///
  /// In en, this message translates to:
  /// **'Trying to fulfill more than in stock'**
  String get createFulfillmentTryingToFulfillMoreThanInStock;

  /// No description provided for @createFulfillmentSuccessfullyFulfilledOrder.
  ///
  /// In en, this message translates to:
  /// **'Successfully fulfilled order'**
  String get createFulfillmentSuccessfullyFulfilledOrder;

  /// No description provided for @createFulfillmentSuccessfullyFulfilledSwap.
  ///
  /// In en, this message translates to:
  /// **'Successfully fulfilled swap'**
  String get createFulfillmentSuccessfullyFulfilledSwap;

  /// No description provided for @createFulfillmentSuccessfullyFulfilledClaim.
  ///
  /// In en, this message translates to:
  /// **'Successfully fulfilled claim'**
  String get createFulfillmentSuccessfullyFulfilledClaim;

  /// No description provided for @createFulfillmentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get createFulfillmentSuccess;

  /// No description provided for @createFulfillmentCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get createFulfillmentCancel;

  /// No description provided for @createFulfillmentCreateFulfillment.
  ///
  /// In en, this message translates to:
  /// **'Create fulfillment'**
  String get createFulfillmentCreateFulfillment;

  /// No description provided for @createFulfillmentCreateFulfillmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Fulfillment'**
  String get createFulfillmentCreateFulfillmentTitle;

  /// No description provided for @createFulfillmentLocations.
  ///
  /// In en, this message translates to:
  /// **'Locations'**
  String get createFulfillmentLocations;

  /// No description provided for @createFulfillmentChooseWhereYouWishToFulfillFrom.
  ///
  /// In en, this message translates to:
  /// **'Choose where you wish to fulfill from.'**
  String get createFulfillmentChooseWhereYouWishToFulfillFrom;

  /// No description provided for @createFulfillmentItemsToFulfill.
  ///
  /// In en, this message translates to:
  /// **'Items to fulfill'**
  String get createFulfillmentItemsToFulfill;

  /// No description provided for @createFulfillmentSelectTheNumberOfItemsThatYouWishToFulfill.
  ///
  /// In en, this message translates to:
  /// **'Select the number of items that you wish to fulfill.'**
  String get createFulfillmentSelectTheNumberOfItemsThatYouWishToFulfill;

  /// No description provided for @createFulfillmentSendNotifications.
  ///
  /// In en, this message translates to:
  /// **'Send notifications'**
  String get createFulfillmentSendNotifications;

  /// No description provided for @createFulfillmentWhenToggledNotificationEmailsWillBeSent.
  ///
  /// In en, this message translates to:
  /// **'When toggled, notification emails will be sent.'**
  String get createFulfillmentWhenToggledNotificationEmailsWillBeSent;

  /// No description provided for @createFulfillmentQuantityIsNotValid.
  ///
  /// In en, this message translates to:
  /// **'Quantity is not valid'**
  String get createFulfillmentQuantityIsNotValid;

  /// No description provided for @detailCardsAllocated.
  ///
  /// In en, this message translates to:
  /// **'Allocated'**
  String get detailCardsAllocated;

  /// No description provided for @detailCardsNotFullyAllocated.
  ///
  /// In en, this message translates to:
  /// **'Not fully allocated'**
  String get detailCardsNotFullyAllocated;

  /// No description provided for @detailCardsSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get detailCardsSubtotal;

  /// No description provided for @detailCardsShipping.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get detailCardsShipping;

  /// No description provided for @detailCardsTax.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get detailCardsTax;

  /// No description provided for @detailCardsTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get detailCardsTotal;

  /// No description provided for @detailCardsEditOrder.
  ///
  /// In en, this message translates to:
  /// **'Edit Order'**
  String get detailCardsEditOrder;

  /// No description provided for @detailCardsAllocate.
  ///
  /// In en, this message translates to:
  /// **'Allocate'**
  String get detailCardsAllocate;

  /// No description provided for @detailCardsDiscount.
  ///
  /// In en, this message translates to:
  /// **'Discount:'**
  String get detailCardsDiscount;

  /// No description provided for @detailCardsOriginalTotal.
  ///
  /// In en, this message translates to:
  /// **'Original Total'**
  String get detailCardsOriginalTotal;

  /// No description provided for @detailsSuccessfullyUpdatedTheEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated the email address'**
  String get detailsSuccessfullyUpdatedTheEmailAddress;

  /// No description provided for @detailsEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get detailsEmailAddress;

  /// No description provided for @detailsSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get detailsSave;

  /// No description provided for @detailsOrderIdCopied.
  ///
  /// In en, this message translates to:
  /// **'Order ID copied'**
  String get detailsOrderIdCopied;

  /// No description provided for @detailsEmailCopied.
  ///
  /// In en, this message translates to:
  /// **'Email copied'**
  String get detailsEmailCopied;

  /// No description provided for @detailsCancelOrderHeading.
  ///
  /// In en, this message translates to:
  /// **'Cancel order'**
  String get detailsCancelOrderHeading;

  /// No description provided for @detailsAreYouSureYouWantToCancelTheOrder.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel the order?'**
  String get detailsAreYouSureYouWantToCancelTheOrder;

  /// No description provided for @orderDetailsDisplayId.
  ///
  /// In en, this message translates to:
  /// **'order #{displayId}'**
  String orderDetailsDisplayId(String displayId, Object display_id);

  /// No description provided for @detailsSuccessfullyCanceledOrder.
  ///
  /// In en, this message translates to:
  /// **'Successfully canceled order'**
  String get detailsSuccessfullyCanceledOrder;

  /// No description provided for @detailsGoToCustomer.
  ///
  /// In en, this message translates to:
  /// **'Go to Customer'**
  String get detailsGoToCustomer;

  /// No description provided for @detailsTransferOwnership.
  ///
  /// In en, this message translates to:
  /// **'Transfer ownership'**
  String get detailsTransferOwnership;

  /// No description provided for @detailsEditShippingAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit Shipping Address'**
  String get detailsEditShippingAddress;

  /// No description provided for @detailsEditBillingAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit Billing Address'**
  String get detailsEditBillingAddress;

  /// No description provided for @detailsEditEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit Email Address'**
  String get detailsEditEmailAddress;

  /// No description provided for @detailsBackToOrders.
  ///
  /// In en, this message translates to:
  /// **'Back to Orders'**
  String get detailsBackToOrders;

  /// No description provided for @detailsCancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get detailsCancelOrder;

  /// No description provided for @detailsPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get detailsPayment;

  /// No description provided for @detailsRefunded.
  ///
  /// In en, this message translates to:
  /// **'Refunded'**
  String get detailsRefunded;

  /// No description provided for @detailsTotalPaid.
  ///
  /// In en, this message translates to:
  /// **'Total Paid'**
  String get detailsTotalPaid;

  /// No description provided for @detailsFulfillment.
  ///
  /// In en, this message translates to:
  /// **'Fulfillment'**
  String get detailsFulfillment;

  /// No description provided for @detailsCreateFulfillment.
  ///
  /// In en, this message translates to:
  /// **'Create Fulfillment'**
  String get detailsCreateFulfillment;

  /// No description provided for @detailsShippingMethod.
  ///
  /// In en, this message translates to:
  /// **'Shipping Method'**
  String get detailsShippingMethod;

  /// No description provided for @detailsCustomer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get detailsCustomer;

  /// No description provided for @detailsShipping.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get detailsShipping;

  /// No description provided for @detailsBilling.
  ///
  /// In en, this message translates to:
  /// **'Billing'**
  String get detailsBilling;

  /// No description provided for @detailsRawOrder.
  ///
  /// In en, this message translates to:
  /// **'Raw order'**
  String get detailsRawOrder;

  /// No description provided for @markShippedSuccessfullyMarkedOrderAsShipped.
  ///
  /// In en, this message translates to:
  /// **'Successfully marked order as shipped'**
  String get markShippedSuccessfullyMarkedOrderAsShipped;

  /// No description provided for @markShippedSuccessfullyMarkedSwapAsShipped.
  ///
  /// In en, this message translates to:
  /// **'Successfully marked swap as shipped'**
  String get markShippedSuccessfullyMarkedSwapAsShipped;

  /// No description provided for @markShippedSuccessfullyMarkedClaimAsShipped.
  ///
  /// In en, this message translates to:
  /// **'Successfully marked claim as shipped'**
  String get markShippedSuccessfullyMarkedClaimAsShipped;

  /// No description provided for @markShippedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get markShippedSuccess;

  /// No description provided for @markShippedError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get markShippedError;

  /// No description provided for @markShippedMarkFulfillmentShipped.
  ///
  /// In en, this message translates to:
  /// **'Mark Fulfillment Shipped'**
  String get markShippedMarkFulfillmentShipped;

  /// No description provided for @markShippedTracking.
  ///
  /// In en, this message translates to:
  /// **'Tracking'**
  String get markShippedTracking;

  /// No description provided for @markShippedTrackingNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Tracking number'**
  String get markShippedTrackingNumberLabel;

  /// No description provided for @markShippedTrackingNumber.
  ///
  /// In en, this message translates to:
  /// **'Tracking number...'**
  String get markShippedTrackingNumber;

  /// No description provided for @markShippedAddAdditionalTrackingNumber.
  ///
  /// In en, this message translates to:
  /// **'+ Add Additional Tracking Number'**
  String get markShippedAddAdditionalTrackingNumber;

  /// No description provided for @markShippedSendNotifications.
  ///
  /// In en, this message translates to:
  /// **'Send notifications'**
  String get markShippedSendNotifications;

  /// No description provided for @markShippedCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get markShippedCancel;

  /// No description provided for @markShippedComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get markShippedComplete;

  /// No description provided for @orderLineWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get orderLineWarning;

  /// No description provided for @orderLineCannotDuplicateAnItemWithoutAVariant.
  ///
  /// In en, this message translates to:
  /// **'Cannot duplicate an item without a variant'**
  String get orderLineCannotDuplicateAnItemWithoutAVariant;

  /// No description provided for @orderLineError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get orderLineError;

  /// No description provided for @orderLineFailedToDuplicateItem.
  ///
  /// In en, this message translates to:
  /// **'Failed to duplicate item'**
  String get orderLineFailedToDuplicateItem;

  /// No description provided for @orderLineSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get orderLineSuccess;

  /// No description provided for @orderLineItemRemoved.
  ///
  /// In en, this message translates to:
  /// **'Item removed'**
  String get orderLineItemRemoved;

  /// No description provided for @orderLineFailedToRemoveItem.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove item'**
  String get orderLineFailedToRemoveItem;

  /// No description provided for @orderLineItemAdded.
  ///
  /// In en, this message translates to:
  /// **'Item added'**
  String get orderLineItemAdded;

  /// No description provided for @orderLineFailedToReplaceTheItem.
  ///
  /// In en, this message translates to:
  /// **'Failed to replace the item'**
  String get orderLineFailedToReplaceTheItem;

  /// No description provided for @orderLineReplaceProductVariants.
  ///
  /// In en, this message translates to:
  /// **'Replace Product Variants'**
  String get orderLineReplaceProductVariants;

  /// No description provided for @orderLineReplaceWithOtherItem.
  ///
  /// In en, this message translates to:
  /// **'Replace with other item'**
  String get orderLineReplaceWithOtherItem;

  /// No description provided for @orderLineDuplicateItem.
  ///
  /// In en, this message translates to:
  /// **'Duplicate item'**
  String get orderLineDuplicateItem;

  /// No description provided for @orderLineRemoveItem.
  ///
  /// In en, this message translates to:
  /// **'Remove item'**
  String get orderLineRemoveItem;

  /// No description provided for @orderLineLineItemCannotBeEdited.
  ///
  /// In en, this message translates to:
  /// **'This line item is part of a fulfillment and cannot be edited. Cancel the fulfillment to edit the line item.'**
  String get orderLineLineItemCannotBeEdited;

  /// No description provided for @orderLineNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get orderLineNew;

  /// No description provided for @orderLineModified.
  ///
  /// In en, this message translates to:
  /// **'Modified'**
  String get orderLineModified;

  /// No description provided for @receiveReturnPleaseSelectAtLeastOneItemToReceive.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one item to receive'**
  String get receiveReturnPleaseSelectAtLeastOneItemToReceive;

  /// No description provided for @receiveReturnSuccessfullyReceivedReturn.
  ///
  /// In en, this message translates to:
  /// **'Successfully received return'**
  String get receiveReturnSuccessfullyReceivedReturn;

  /// No description provided for @receiveReturnReceivedReturnForOrder.
  ///
  /// In en, this message translates to:
  /// **'Received return for order #{display_id}'**
  String receiveReturnReceivedReturnForOrder(String display_id);

  /// No description provided for @receiveReturnFailedToReceiveReturn.
  ///
  /// In en, this message translates to:
  /// **'Failed to receive return'**
  String get receiveReturnFailedToReceiveReturn;

  /// No description provided for @receiveReturnReceiveReturn.
  ///
  /// In en, this message translates to:
  /// **'Receive Return'**
  String get receiveReturnReceiveReturn;

  /// No description provided for @receiveReturnLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get receiveReturnLocation;

  /// No description provided for @receiveReturnChooseLocation.
  ///
  /// In en, this message translates to:
  /// **'Choose which location you want to return the items to.'**
  String get receiveReturnChooseLocation;

  /// No description provided for @receiveReturnSelectLocationToReturnTo.
  ///
  /// In en, this message translates to:
  /// **'Select Location to Return to'**
  String get receiveReturnSelectLocationToReturnTo;

  /// No description provided for @receiveReturnNoInventoryLevelsExistForTheItemsAtTheSelectedLocation.
  ///
  /// In en, this message translates to:
  /// **'No inventory levels exist for the items at the selected location'**
  String
      get receiveReturnNoInventoryLevelsExistForTheItemsAtTheSelectedLocation;

  /// No description provided for @receiveReturnCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get receiveReturnCancel;

  /// No description provided for @receiveReturnSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get receiveReturnSaveAndClose;

  /// No description provided for @refundSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get refundSuccess;

  /// No description provided for @refundSuccessfullyRefundedOrder.
  ///
  /// In en, this message translates to:
  /// **'Successfully refunded order'**
  String get refundSuccessfullyRefundedOrder;

  /// No description provided for @refundError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get refundError;

  /// No description provided for @refundCreateARefund.
  ///
  /// In en, this message translates to:
  /// **'Create a refund'**
  String get refundCreateARefund;

  /// No description provided for @refundAttention.
  ///
  /// In en, this message translates to:
  /// **'Attention!'**
  String get refundAttention;

  /// No description provided for @refundSystemPaymentDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'One or more of your payments is a system payment. Be aware, that captures and refunds are not handled by Medusa for such payments.'**
  String get refundSystemPaymentDisclaimer;

  /// No description provided for @refundDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get refundDetails;

  /// No description provided for @refundCannotRefundMoreThanTheOrdersNetTotal.
  ///
  /// In en, this message translates to:
  /// **'Cannot refund more than the order\'s net total.'**
  String get refundCannotRefundMoreThanTheOrdersNetTotal;

  /// No description provided for @refundDiscount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get refundDiscount;

  /// No description provided for @refundReason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get refundReason;

  /// No description provided for @refundNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get refundNote;

  /// No description provided for @refundDiscountForLoyalCustomer.
  ///
  /// In en, this message translates to:
  /// **'Discount for loyal customer'**
  String get refundDiscountForLoyalCustomer;

  /// No description provided for @refundSendNotifications.
  ///
  /// In en, this message translates to:
  /// **'Send notifications'**
  String get refundSendNotifications;

  /// No description provided for @refundCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get refundCancel;

  /// No description provided for @refundComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get refundComplete;

  /// No description provided for @reservationReservationWasDeleted.
  ///
  /// In en, this message translates to:
  /// **'Reservation was deleted'**
  String get reservationReservationWasDeleted;

  /// No description provided for @reservationTheAllocatedItemsHaveBeenReleased.
  ///
  /// In en, this message translates to:
  /// **'The allocated items have been released.'**
  String get reservationTheAllocatedItemsHaveBeenReleased;

  /// No description provided for @reservationError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get reservationError;

  /// No description provided for @reservationFailedToDeleteTheReservation.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete the reservation '**
  String get reservationFailedToDeleteTheReservation;

  /// No description provided for @reservationReservationWasUpdated.
  ///
  /// In en, this message translates to:
  /// **'Reservation was updated'**
  String get reservationReservationWasUpdated;

  /// No description provided for @reservationTheReservationChangeWasSaved.
  ///
  /// In en, this message translates to:
  /// **'The reservation change was saved.'**
  String get reservationTheReservationChangeWasSaved;

  /// No description provided for @reservationErrors.
  ///
  /// In en, this message translates to:
  /// **'Errors'**
  String get reservationErrors;

  /// No description provided for @reservationFailedToUpdateReservation.
  ///
  /// In en, this message translates to:
  /// **'Failed to update reservation'**
  String get reservationFailedToUpdateReservation;

  /// No description provided for @reservationEditReservation.
  ///
  /// In en, this message translates to:
  /// **'Edit Reservation'**
  String get reservationEditReservation;

  /// No description provided for @reservationLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get reservationLocation;

  /// No description provided for @reservationChooseWhichLocationYouWantToShipTheItemsFrom.
  ///
  /// In en, this message translates to:
  /// **'Choose which location you want to ship the items from.'**
  String get reservationChooseWhichLocationYouWantToShipTheItemsFrom;

  /// No description provided for @reservationItemsToAllocateTitle.
  ///
  /// In en, this message translates to:
  /// **'Items to Allocate'**
  String get reservationItemsToAllocateTitle;

  /// No description provided for @reservationSelectTheNumberOfItemsThatYouWishToAllocate.
  ///
  /// In en, this message translates to:
  /// **'Select the number of items that you wish to allocate.'**
  String get reservationSelectTheNumberOfItemsThatYouWishToAllocate;

  /// No description provided for @reservationMaxReservationRequested.
  ///
  /// In en, this message translates to:
  /// **' / {maxReservation} requested'**
  String reservationMaxReservationRequested(String maxReservation);

  /// No description provided for @reservationReserved.
  ///
  /// In en, this message translates to:
  /// **' reserved'**
  String get reservationReserved;

  /// No description provided for @reservationDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get reservationDescription;

  /// No description provided for @reservationWhatTypeOfReservationIsThis.
  ///
  /// In en, this message translates to:
  /// **'What type of reservation is this?'**
  String get reservationWhatTypeOfReservationIsThis;

  /// No description provided for @reservationMetadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get reservationMetadata;

  /// No description provided for @reservationRemoveMetadata.
  ///
  /// In en, this message translates to:
  /// **'Remove metadata'**
  String get reservationRemoveMetadata;

  /// No description provided for @reservationAddMetadata.
  ///
  /// In en, this message translates to:
  /// **'Add metadata'**
  String get reservationAddMetadata;

  /// No description provided for @reservationDeleteReservation.
  ///
  /// In en, this message translates to:
  /// **'Delete reservation'**
  String get reservationDeleteReservation;

  /// No description provided for @reservationCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get reservationCancel;

  /// No description provided for @reservationSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get reservationSaveAndClose;

  /// No description provided for @reservationCouldntAllocateItems.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t allocate items'**
  String get reservationCouldntAllocateItems;

  /// No description provided for @reservationItemsAllocated.
  ///
  /// In en, this message translates to:
  /// **'Items allocated'**
  String get reservationItemsAllocated;

  /// No description provided for @reservationItemsHaveBeenAllocatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Items have been allocated successfully'**
  String get reservationItemsHaveBeenAllocatedSuccessfully;

  /// No description provided for @reservationSaveReservation.
  ///
  /// In en, this message translates to:
  /// **'Save reservation'**
  String get reservationSaveReservation;

  /// No description provided for @reservationLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get reservationLoading;

  /// No description provided for @reservationAllocateOrderItems.
  ///
  /// In en, this message translates to:
  /// **'Allocate order items'**
  String get reservationAllocateOrderItems;

  /// No description provided for @reservationChooseWhereYouWishToAllocateFrom.
  ///
  /// In en, this message translates to:
  /// **'Choose where you wish to allocate from'**
  String get reservationChooseWhereYouWishToAllocateFrom;

  /// No description provided for @reservationItemsToAllocate.
  ///
  /// In en, this message translates to:
  /// **'Items to allocate'**
  String get reservationItemsToAllocate;

  /// No description provided for @returnsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get returnsSuccess;

  /// No description provided for @returnsSuccessfullyReturnedOrder.
  ///
  /// In en, this message translates to:
  /// **'Successfully returned order'**
  String get returnsSuccessfullyReturnedOrder;

  /// No description provided for @returnsError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get returnsError;

  /// No description provided for @returnsRequestReturn.
  ///
  /// In en, this message translates to:
  /// **'Request Return'**
  String get returnsRequestReturn;

  /// No description provided for @returnsItemsToReturn.
  ///
  /// In en, this message translates to:
  /// **'Items to return'**
  String get returnsItemsToReturn;

  /// No description provided for @returnsChooseWhichLocationYouWantToReturnTheItemsTo.
  ///
  /// In en, this message translates to:
  /// **'Choose which location you want to return the items to.'**
  String get returnsChooseWhichLocationYouWantToReturnTheItemsTo;

  /// No description provided for @returnsSelectLocationToReturnTo.
  ///
  /// In en, this message translates to:
  /// **'Select Location to Return to'**
  String get returnsSelectLocationToReturnTo;

  /// No description provided for @returnsSelectedLocationHasNoInventoryLevels.
  ///
  /// In en, this message translates to:
  /// **'The selected location does not have inventory levels for the selected items. The return can be requested but can\'t be received until an inventory level is created for the selected location.'**
  String get returnsSelectedLocationHasNoInventoryLevels;

  /// No description provided for @returnsShipping.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get returnsShipping;

  /// No description provided for @returnsChooseReturShippingMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose which shipping method you want to use for this return.'**
  String get returnsChooseReturShippingMethod;

  /// No description provided for @returnsTotalRefund.
  ///
  /// In en, this message translates to:
  /// **'Total Refund'**
  String get returnsTotalRefund;

  /// No description provided for @returnsAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get returnsAmount;

  /// No description provided for @returnsSendNotifications.
  ///
  /// In en, this message translates to:
  /// **'Send notifications'**
  String get returnsSendNotifications;

  /// No description provided for @returnsNotifyCustomerOfCreatedReturn.
  ///
  /// In en, this message translates to:
  /// **'Notify customer of created return'**
  String get returnsNotifyCustomerOfCreatedReturn;

  /// No description provided for @returnsBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get returnsBack;

  /// No description provided for @returnsSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get returnsSubmit;

  /// No description provided for @rmaSubModalsSearchForAdditional.
  ///
  /// In en, this message translates to:
  /// **'Search for additional'**
  String get rmaSubModalsSearchForAdditional;

  /// No description provided for @rmaSubModalsGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get rmaSubModalsGeneral;

  /// No description provided for @rmaSubModalsFirstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get rmaSubModalsFirstName;

  /// No description provided for @rmaSubModalsLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get rmaSubModalsLastName;

  /// No description provided for @rmaSubModalsPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get rmaSubModalsPhone;

  /// No description provided for @rmaSubModalsShippingAddress.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get rmaSubModalsShippingAddress;

  /// No description provided for @rmaSubModalsAddress1.
  ///
  /// In en, this message translates to:
  /// **'Address 1'**
  String get rmaSubModalsAddress1;

  /// No description provided for @rmaSubModalsAddress2.
  ///
  /// In en, this message translates to:
  /// **'Address 2'**
  String get rmaSubModalsAddress2;

  /// No description provided for @rmaSubModalsProvince.
  ///
  /// In en, this message translates to:
  /// **'Province'**
  String get rmaSubModalsProvince;

  /// No description provided for @rmaSubModalsPostalCode.
  ///
  /// In en, this message translates to:
  /// **'Postal code'**
  String get rmaSubModalsPostalCode;

  /// No description provided for @rmaSubModalsCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get rmaSubModalsCity;

  /// No description provided for @rmaSubModalsCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get rmaSubModalsCountry;

  /// No description provided for @rmaSubModalsBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get rmaSubModalsBack;

  /// No description provided for @rmaSubModalsAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get rmaSubModalsAdd;

  /// No description provided for @rmaSubModalsName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get rmaSubModalsName;

  /// No description provided for @rmaSubModalsStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get rmaSubModalsStatus;

  /// No description provided for @rmaSubModalsInStock.
  ///
  /// In en, this message translates to:
  /// **'In Stock'**
  String get rmaSubModalsInStock;

  /// No description provided for @rmaSubModalsProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get rmaSubModalsProducts;

  /// No description provided for @rmaSubModalsSearchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search Products..'**
  String get rmaSubModalsSearchProducts;

  /// No description provided for @rmaSubModalsReasonForReturn.
  ///
  /// In en, this message translates to:
  /// **'Reason for Return'**
  String get rmaSubModalsReasonForReturn;

  /// No description provided for @rmaSubModalsReason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get rmaSubModalsReason;

  /// No description provided for @rmaSubModalsNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get rmaSubModalsNote;

  /// No description provided for @swapSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get swapSuccess;

  /// No description provided for @swapSuccessfullyCreatedExchange.
  ///
  /// In en, this message translates to:
  /// **'Successfully created exchange'**
  String get swapSuccessfullyCreatedExchange;

  /// No description provided for @swapError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get swapError;

  /// No description provided for @swapRegisterExchange.
  ///
  /// In en, this message translates to:
  /// **'Register Exchange'**
  String get swapRegisterExchange;

  /// No description provided for @swapItemsToReturn.
  ///
  /// In en, this message translates to:
  /// **'Items to return'**
  String get swapItemsToReturn;

  /// No description provided for @swapShipping.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get swapShipping;

  /// No description provided for @swapShippingMethod.
  ///
  /// In en, this message translates to:
  /// **'Shipping Method'**
  String get swapShippingMethod;

  /// No description provided for @swapAddAShippingMethod.
  ///
  /// In en, this message translates to:
  /// **'Add a shipping method'**
  String get swapAddAShippingMethod;

  /// No description provided for @swapLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get swapLocation;

  /// No description provided for @swapChooseWhichLocationYouWantToReturnTheItemsTo.
  ///
  /// In en, this message translates to:
  /// **'Choose which location you want to return the items to.'**
  String get swapChooseWhichLocationYouWantToReturnTheItemsTo;

  /// No description provided for @swapSelectLocationToReturnTo.
  ///
  /// In en, this message translates to:
  /// **'Select Location to Return to'**
  String get swapSelectLocationToReturnTo;

  /// No description provided for @swapItemsToSend.
  ///
  /// In en, this message translates to:
  /// **'Items to send'**
  String get swapItemsToSend;

  /// No description provided for @swapAddProduct.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get swapAddProduct;

  /// No description provided for @swapReturnTotal.
  ///
  /// In en, this message translates to:
  /// **'Return Total'**
  String get swapReturnTotal;

  /// No description provided for @swapAdditionalTotal.
  ///
  /// In en, this message translates to:
  /// **'Additional Total'**
  String get swapAdditionalTotal;

  /// No description provided for @swapOutbondShipping.
  ///
  /// In en, this message translates to:
  /// **'Outbond Shipping'**
  String get swapOutbondShipping;

  /// No description provided for @swapCalculatedAtCheckout.
  ///
  /// In en, this message translates to:
  /// **'Calculated at checkout'**
  String get swapCalculatedAtCheckout;

  /// No description provided for @swapEstimatedDifference.
  ///
  /// In en, this message translates to:
  /// **'Estimated difference'**
  String get swapEstimatedDifference;

  /// No description provided for @swapSendNotifications.
  ///
  /// In en, this message translates to:
  /// **'Send notifications'**
  String get swapSendNotifications;

  /// No description provided for @swapIfUncheckedTheCustomerWillNotReceiveCommunicationAboutThisExchange.
  ///
  /// In en, this message translates to:
  /// **'If unchecked the customer will not receive communication about this exchange'**
  String
      get swapIfUncheckedTheCustomerWillNotReceiveCommunicationAboutThisExchange;

  /// No description provided for @swapComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get swapComplete;

  /// No description provided for @templatesShipped.
  ///
  /// In en, this message translates to:
  /// **'Shipped'**
  String get templatesShipped;

  /// No description provided for @templatesFulfilled.
  ///
  /// In en, this message translates to:
  /// **'Fulfilled'**
  String get templatesFulfilled;

  /// No description provided for @templatesCanceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get templatesCanceled;

  /// No description provided for @templatesPartiallyFulfilled.
  ///
  /// In en, this message translates to:
  /// **'Partially fulfilled'**
  String get templatesPartiallyFulfilled;

  /// No description provided for @templatesFulfillmentStatusRequiresAction.
  ///
  /// In en, this message translates to:
  /// **'Requires Action'**
  String get templatesFulfillmentStatusRequiresAction;

  /// No description provided for @templatesAwaitingFulfillment.
  ///
  /// In en, this message translates to:
  /// **'Awaiting fulfillment'**
  String get templatesAwaitingFulfillment;

  /// No description provided for @templatesPartiallyShipped.
  ///
  /// In en, this message translates to:
  /// **'Partially Shipped'**
  String get templatesPartiallyShipped;

  /// No description provided for @templatesCancelFulfillmentHeading.
  ///
  /// In en, this message translates to:
  /// **'Cancel fulfillment?'**
  String get templatesCancelFulfillmentHeading;

  /// No description provided for @templatesAreYouSureYouWantToCancelTheFulfillment.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel the fulfillment?'**
  String get templatesAreYouSureYouWantToCancelTheFulfillment;

  /// No description provided for @templatesSuccessfullyCanceledSwap.
  ///
  /// In en, this message translates to:
  /// **'Successfully canceled swap'**
  String get templatesSuccessfullyCanceledSwap;

  /// No description provided for @templatesError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get templatesError;

  /// No description provided for @templatesSuccessfullyCanceledClaim.
  ///
  /// In en, this message translates to:
  /// **'Successfully canceled claim'**
  String get templatesSuccessfullyCanceledClaim;

  /// No description provided for @templatesSuccessfullyCanceledFulfillment.
  ///
  /// In en, this message translates to:
  /// **'Successfully canceled fulfillment'**
  String get templatesSuccessfullyCanceledFulfillment;

  /// No description provided for @templatesFulfillmentHasBeenCanceled.
  ///
  /// In en, this message translates to:
  /// **'Fulfillment has been canceled'**
  String get templatesFulfillmentHasBeenCanceled;

  /// No description provided for @templatesFulfilledByProvider.
  ///
  /// In en, this message translates to:
  /// **'{title} Fulfilled by {provider}'**
  String templatesFulfilledByProvider(String title, String provider);

  /// No description provided for @templatesNotShipped.
  ///
  /// In en, this message translates to:
  /// **'Not shipped'**
  String get templatesNotShipped;

  /// No description provided for @templatesTracking.
  ///
  /// In en, this message translates to:
  /// **'Tracking'**
  String get templatesTracking;

  /// No description provided for @templatesShippedFrom.
  ///
  /// In en, this message translates to:
  /// **'Shipped from'**
  String get templatesShippedFrom;

  /// No description provided for @templatesShippingFrom.
  ///
  /// In en, this message translates to:
  /// **'Shipping from'**
  String get templatesShippingFrom;

  /// No description provided for @templatesMarkShipped.
  ///
  /// In en, this message translates to:
  /// **'Mark Shipped'**
  String get templatesMarkShipped;

  /// No description provided for @templatesCancelFulfillment.
  ///
  /// In en, this message translates to:
  /// **'Cancel Fulfillment'**
  String get templatesCancelFulfillment;

  /// No description provided for @templatesCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get templatesCompleted;

  /// No description provided for @templatesProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get templatesProcessing;

  /// No description provided for @templatesRequiresAction.
  ///
  /// In en, this message translates to:
  /// **'Requires action'**
  String get templatesRequiresAction;

  /// No description provided for @templatesCapturePayment.
  ///
  /// In en, this message translates to:
  /// **'Capture payment'**
  String get templatesCapturePayment;

  /// No description provided for @templatesSuccessfullyCapturedPayment.
  ///
  /// In en, this message translates to:
  /// **'Successfully captured payment'**
  String get templatesSuccessfullyCapturedPayment;

  /// No description provided for @templatesRefund.
  ///
  /// In en, this message translates to:
  /// **'Refund'**
  String get templatesRefund;

  /// No description provided for @templatesTotalForSwaps.
  ///
  /// In en, this message translates to:
  /// **'Total for Swaps'**
  String get templatesTotalForSwaps;

  /// No description provided for @templatesRefundedForSwaps.
  ///
  /// In en, this message translates to:
  /// **'Refunded for Swaps'**
  String get templatesRefundedForSwaps;

  /// No description provided for @templatesRefundedForReturns.
  ///
  /// In en, this message translates to:
  /// **'Refunded for Returns'**
  String get templatesRefundedForReturns;

  /// No description provided for @templatesManuallyRefunded.
  ///
  /// In en, this message translates to:
  /// **'Manually refunded'**
  String get templatesManuallyRefunded;

  /// No description provided for @templatesNetTotal.
  ///
  /// In en, this message translates to:
  /// **'Net Total'**
  String get templatesNetTotal;

  /// No description provided for @templatesPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get templatesPaid;

  /// No description provided for @templatesAwaitingPayment.
  ///
  /// In en, this message translates to:
  /// **'Awaiting payment'**
  String get templatesAwaitingPayment;

  /// No description provided for @templatesPaymentStatusRequiresAction.
  ///
  /// In en, this message translates to:
  /// **'Requires Action'**
  String get templatesPaymentStatusRequiresAction;

  /// No description provided for @draftOrdersCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get draftOrdersCompleted;

  /// No description provided for @draftOrdersOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get draftOrdersOpen;

  /// No description provided for @draftOrdersMarkAsPaid.
  ///
  /// In en, this message translates to:
  /// **'Mark as paid'**
  String get draftOrdersMarkAsPaid;

  /// No description provided for @draftOrdersSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get draftOrdersSuccess;

  /// No description provided for @draftOrdersSuccessfullyMarkAsPaid.
  ///
  /// In en, this message translates to:
  /// **'Successfully mark as paid'**
  String get draftOrdersSuccessfullyMarkAsPaid;

  /// No description provided for @draftOrdersError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get draftOrdersError;

  /// No description provided for @draftOrdersSuccessfullyCanceledOrder.
  ///
  /// In en, this message translates to:
  /// **'Successfully canceled order'**
  String get draftOrdersSuccessfullyCanceledOrder;

  /// No description provided for @draftOrdersBackToDraftOrders.
  ///
  /// In en, this message translates to:
  /// **'Back to Draft Orders'**
  String get draftOrdersBackToDraftOrders;

  /// No description provided for @onMarkAsPaidConfirmOrderId.
  ///
  /// In en, this message translates to:
  /// **'Order #{displayId}'**
  String onMarkAsPaidConfirmOrderId(String displayId, Object display_id);

  /// No description provided for @draftOrdersGoToOrder.
  ///
  /// In en, this message translates to:
  /// **'Go to Order'**
  String get draftOrdersGoToOrder;

  /// No description provided for @draftOrdersCancelDraftOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Draft Order'**
  String get draftOrdersCancelDraftOrder;

  /// No description provided for @draftOrdersDraftOrder.
  ///
  /// In en, this message translates to:
  /// **'Draft Order'**
  String get draftOrdersDraftOrder;

  /// No description provided for @draftOrdersEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get draftOrdersEmail;

  /// No description provided for @draftOrdersPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get draftOrdersPhone;

  /// No description provided for @draftOrdersAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount {currencyCode}'**
  String draftOrdersAmount(String currencyCode, Object currency_code);

  /// No description provided for @draftOrdersPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get draftOrdersPayment;

  /// No description provided for @draftOrdersSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get draftOrdersSubtotal;

  /// No description provided for @draftOrdersShipping.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get draftOrdersShipping;

  /// No description provided for @draftOrdersTax.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get draftOrdersTax;

  /// No description provided for @draftOrdersTotalToPay.
  ///
  /// In en, this message translates to:
  /// **'Total to pay'**
  String get draftOrdersTotalToPay;

  /// No description provided for @draftOrdersPaymentLink.
  ///
  /// In en, this message translates to:
  /// **'Payment link:'**
  String get draftOrdersPaymentLink;

  /// No description provided for @draftOrdersConfigurePaymentLinkInStoreSettings.
  ///
  /// In en, this message translates to:
  /// **'Configure payment link in store settings'**
  String get draftOrdersConfigurePaymentLinkInStoreSettings;

  /// No description provided for @draftOrdersShippingMethod.
  ///
  /// In en, this message translates to:
  /// **'Shipping Method'**
  String get draftOrdersShippingMethod;

  /// No description provided for @draftOrdersData.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get draftOrdersData;

  /// No description provided for @draftOrders1Item.
  ///
  /// In en, this message translates to:
  /// **'(1 item)'**
  String get draftOrders1Item;

  /// No description provided for @draftOrdersCustomer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get draftOrdersCustomer;

  /// No description provided for @draftOrdersEditShippingAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit Shipping Address'**
  String get draftOrdersEditShippingAddress;

  /// No description provided for @draftOrdersEditBillingAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit Billing Address'**
  String get draftOrdersEditBillingAddress;

  /// No description provided for @draftOrdersGoToCustomer.
  ///
  /// In en, this message translates to:
  /// **'Go to Customer'**
  String get draftOrdersGoToCustomer;

  /// No description provided for @draftOrdersContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get draftOrdersContact;

  /// No description provided for @draftOrdersBilling.
  ///
  /// In en, this message translates to:
  /// **'Billing'**
  String get draftOrdersBilling;

  /// No description provided for @draftOrdersRawDraftOrder.
  ///
  /// In en, this message translates to:
  /// **'Raw Draft Order'**
  String get draftOrdersRawDraftOrder;

  /// No description provided for @draftOrdersAreYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get draftOrdersAreYouSure;

  /// No description provided for @draftOrdersRemoveResourceHeading.
  ///
  /// In en, this message translates to:
  /// **'Remove {resource}'**
  String draftOrdersRemoveResourceHeading(String resource);

  /// No description provided for @draftOrdersRemoveResourceSuccessText.
  ///
  /// In en, this message translates to:
  /// **'{resource} has been removed'**
  String draftOrdersRemoveResourceSuccessText(String resource);

  /// No description provided for @draftOrdersThisWillCreateAnOrderMarkThisAsPaidIfYouReceivedThePayment.
  ///
  /// In en, this message translates to:
  /// **'This will create an order. Mark this as paid if you received the payment.'**
  String
      get draftOrdersThisWillCreateAnOrderMarkThisAsPaidIfYouReceivedThePayment;

  /// No description provided for @draftOrdersMarkPaid.
  ///
  /// In en, this message translates to:
  /// **'Mark paid'**
  String get draftOrdersMarkPaid;

  /// No description provided for @draftOrdersCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get draftOrdersCancel;

  /// No description provided for @draftOrdersCreateDraftOrder.
  ///
  /// In en, this message translates to:
  /// **'Create draft order'**
  String get draftOrdersCreateDraftOrder;

  /// No description provided for @editAmountPaid.
  ///
  /// In en, this message translates to:
  /// **'Amount Paid'**
  String get editAmountPaid;

  /// No description provided for @editNewTotal.
  ///
  /// In en, this message translates to:
  /// **'New Total'**
  String get editNewTotal;

  /// No description provided for @editDifferenceDue.
  ///
  /// In en, this message translates to:
  /// **'Difference Due'**
  String get editDifferenceDue;

  /// No description provided for @editBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get editBack;

  /// No description provided for @editSaveAndGoBack.
  ///
  /// In en, this message translates to:
  /// **'Save and go back'**
  String get editSaveAndGoBack;

  /// No description provided for @editOrderEditSetAsRequested.
  ///
  /// In en, this message translates to:
  /// **'Order edit set as requested'**
  String get editOrderEditSetAsRequested;

  /// No description provided for @editFailedToRequestConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Failed to request confirmation'**
  String get editFailedToRequestConfirmation;

  /// No description provided for @editAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Added successfully'**
  String get editAddedSuccessfully;

  /// No description provided for @editErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Error occurred'**
  String get editErrorOccurred;

  /// No description provided for @editAddProductVariants.
  ///
  /// In en, this message translates to:
  /// **'Add Product Variants'**
  String get editAddProductVariants;

  /// No description provided for @editEditOrder.
  ///
  /// In en, this message translates to:
  /// **'Edit Order'**
  String get editEditOrder;

  /// No description provided for @editItems.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get editItems;

  /// No description provided for @editAddItems.
  ///
  /// In en, this message translates to:
  /// **'Add items'**
  String get editAddItems;

  /// No description provided for @editFilterItems.
  ///
  /// In en, this message translates to:
  /// **'Filter items...'**
  String get editFilterItems;

  /// No description provided for @editNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get editNote;

  /// No description provided for @editAddANote.
  ///
  /// In en, this message translates to:
  /// **'Add a note...'**
  String get editAddANote;

  /// No description provided for @variantsTableLocation.
  ///
  /// In en, this message translates to:
  /// **' in {location}'**
  String variantsTableLocation(String location);

  /// No description provided for @editProduct.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get editProduct;

  /// No description provided for @editInStock.
  ///
  /// In en, this message translates to:
  /// **'In Stock'**
  String get editInStock;

  /// No description provided for @editPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get editPrice;

  /// No description provided for @editProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get editProducts;

  /// No description provided for @editSearchProductVariants.
  ///
  /// In en, this message translates to:
  /// **'Search Product Variants...'**
  String get editSearchProductVariants;

  /// No description provided for @ordersSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get ordersSuccess;

  /// No description provided for @ordersSuccessfullyInitiatedExport.
  ///
  /// In en, this message translates to:
  /// **'Successfully initiated export'**
  String get ordersSuccessfullyInitiatedExport;

  /// No description provided for @ordersError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get ordersError;

  /// No description provided for @ordersExportOrders.
  ///
  /// In en, this message translates to:
  /// **'Export Orders'**
  String get ordersExportOrders;

  /// No description provided for @componentsBillingAddress.
  ///
  /// In en, this message translates to:
  /// **'Billing Address'**
  String get componentsBillingAddress;

  /// No description provided for @componentsUseSameAsShipping.
  ///
  /// In en, this message translates to:
  /// **'Use same as shipping'**
  String get componentsUseSameAsShipping;

  /// No description provided for @componentsEGGiftWrapping.
  ///
  /// In en, this message translates to:
  /// **'E.g. Gift wrapping'**
  String get componentsEGGiftWrapping;

  /// No description provided for @componentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get componentsTitle;

  /// No description provided for @componentsPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get componentsPrice;

  /// No description provided for @componentsQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get componentsQuantity;

  /// No description provided for @componentsBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get componentsBack;

  /// No description provided for @componentsAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get componentsAdd;

  /// No description provided for @componentsItemsForTheOrder.
  ///
  /// In en, this message translates to:
  /// **'Items for the order'**
  String get componentsItemsForTheOrder;

  /// No description provided for @componentsDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get componentsDetails;

  /// No description provided for @componentsPriceExclTaxes.
  ///
  /// In en, this message translates to:
  /// **'Price (excl. Taxes)'**
  String get componentsPriceExclTaxes;

  /// No description provided for @componentsAddCustom.
  ///
  /// In en, this message translates to:
  /// **'Add Custom'**
  String get componentsAddCustom;

  /// No description provided for @componentsAddExisting.
  ///
  /// In en, this message translates to:
  /// **'Add Existing'**
  String get componentsAddExisting;

  /// No description provided for @componentsAddProducts.
  ///
  /// In en, this message translates to:
  /// **'Add Products'**
  String get componentsAddProducts;

  /// No description provided for @componentsAddCustomItem.
  ///
  /// In en, this message translates to:
  /// **'Add Custom Item'**
  String get componentsAddCustomItem;

  /// No description provided for @componentsChooseRegion.
  ///
  /// In en, this message translates to:
  /// **'Choose region'**
  String get componentsChooseRegion;

  /// No description provided for @componentsRegion.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get componentsRegion;

  /// No description provided for @selectShippingToName.
  ///
  /// In en, this message translates to:
  /// **'(To {name})'**
  String selectShippingToName(String name);

  /// No description provided for @componentsAttention.
  ///
  /// In en, this message translates to:
  /// **'Attention!'**
  String get componentsAttention;

  /// No description provided for @componentsNoOptionsForOrdersWithoutShipping.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any options for orders without shipping. Please add one (e.g. In-store fulfillment) with Show on website unchecked in region settings and continue.'**
  String get componentsNoOptionsForOrdersWithoutShipping;

  /// No description provided for @componentsChooseAShippingMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose a shipping method'**
  String get componentsChooseAShippingMethod;

  /// No description provided for @componentsSetCustomPrice.
  ///
  /// In en, this message translates to:
  /// **'Set custom price'**
  String get componentsSetCustomPrice;

  /// No description provided for @componentsCustomPrice.
  ///
  /// In en, this message translates to:
  /// **'Custom Price'**
  String get componentsCustomPrice;

  /// No description provided for @componentsCustomerAndShippingDetails.
  ///
  /// In en, this message translates to:
  /// **'Customer and shipping details'**
  String get componentsCustomerAndShippingDetails;

  /// No description provided for @componentsFindExistingCustomer.
  ///
  /// In en, this message translates to:
  /// **'Find existing customer'**
  String get componentsFindExistingCustomer;

  /// No description provided for @componentsEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get componentsEmail;

  /// No description provided for @componentsChooseExistingAddresses.
  ///
  /// In en, this message translates to:
  /// **'Choose existing addresses'**
  String get componentsChooseExistingAddresses;

  /// No description provided for @componentsCreateNew.
  ///
  /// In en, this message translates to:
  /// **'Create new'**
  String get componentsCreateNew;

  /// No description provided for @componentsTheDiscountIsNotApplicableToTheSelectedRegion.
  ///
  /// In en, this message translates to:
  /// **'The discount is not applicable to the selected region'**
  String get componentsTheDiscountIsNotApplicableToTheSelectedRegion;

  /// No description provided for @componentsTheDiscountCodeIsInvalid.
  ///
  /// In en, this message translates to:
  /// **'The discount code is invalid'**
  String get componentsTheDiscountCodeIsInvalid;

  /// No description provided for @componentsAddDiscount.
  ///
  /// In en, this message translates to:
  /// **'Add Discount'**
  String get componentsAddDiscount;

  /// No description provided for @componentsSummer10.
  ///
  /// In en, this message translates to:
  /// **'SUMMER10'**
  String get componentsSummer10;

  /// No description provided for @componentsDiscount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get componentsDiscount;

  /// No description provided for @selectShippingCode.
  ///
  /// In en, this message translates to:
  /// **'(Code: {code})'**
  String selectShippingCode(String code);

  /// No description provided for @componentsType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get componentsType;

  /// No description provided for @componentsValue.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get componentsValue;

  /// No description provided for @componentsAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get componentsAddress;

  /// No description provided for @componentsShippingMethod.
  ///
  /// In en, this message translates to:
  /// **'Shipping method'**
  String get componentsShippingMethod;

  /// No description provided for @componentsBillingDetails.
  ///
  /// In en, this message translates to:
  /// **'Billing details'**
  String get componentsBillingDetails;

  /// No description provided for @componentsEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get componentsEdit;

  /// No description provided for @formUseNewOrderFormMustBeUsedWithinNewOrderFormProvider.
  ///
  /// In en, this message translates to:
  /// **'useNewOrderForm must be used within NewOrderFormProvider'**
  String get formUseNewOrderFormMustBeUsedWithinNewOrderFormProvider;

  /// No description provided for @newOrderCreated.
  ///
  /// In en, this message translates to:
  /// **'Order created'**
  String get newOrderCreated;

  /// No description provided for @newCreateDraftOrder.
  ///
  /// In en, this message translates to:
  /// **'Create Draft Order'**
  String get newCreateDraftOrder;

  /// No description provided for @priceListProductFilterCreatedAt.
  ///
  /// In en, this message translates to:
  /// **'Created at'**
  String get priceListProductFilterCreatedAt;

  /// No description provided for @priceListProductFilterUpdatedAt.
  ///
  /// In en, this message translates to:
  /// **'Updated at'**
  String get priceListProductFilterUpdatedAt;

  /// No description provided for @priceListDetailsDrawerPromptTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get priceListDetailsDrawerPromptTitle;

  /// No description provided for @priceListDetailsDrawerPromptDescription.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes, are you sure you want to exit?'**
  String get priceListDetailsDrawerPromptDescription;

  /// No description provided for @priceListDetailsNotificationSuccesTitle.
  ///
  /// In en, this message translates to:
  /// **'Price list updated'**
  String get priceListDetailsNotificationSuccesTitle;

  /// No description provided for @priceListDetailsDrawerNotificationSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated price list'**
  String get priceListDetailsDrawerNotificationSuccessMessage;

  /// No description provided for @priceListDetailsDrawerNotificationErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get priceListDetailsDrawerNotificationErrorTitle;

  /// No description provided for @priceListDetailsDrawerTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Price List Details'**
  String get priceListDetailsDrawerTitle;

  /// No description provided for @priceListDetailsDrawerCancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get priceListDetailsDrawerCancelButton;

  /// No description provided for @priceListDetailsDrawerSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get priceListDetailsDrawerSaveButton;

  /// No description provided for @priceListDetailsSectionPromptConfirmText.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get priceListDetailsSectionPromptConfirmText;

  /// No description provided for @priceListDetailsSectionPromptCancelText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get priceListDetailsSectionPromptCancelText;

  /// No description provided for @priceListDetailsSectionPromptTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete price list'**
  String get priceListDetailsSectionPromptTitle;

  /// No description provided for @priceListDetailsSectionPromptDescription.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the price list {name}?'**
  String priceListDetailsSectionPromptDescription(String name);

  /// No description provided for @priceListDetailsSectionDeleteNotificationSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Successfully deleted price list'**
  String get priceListDetailsSectionDeleteNotificationSuccessTitle;

  /// No description provided for @priceListDetailsSectionDeleteNotificationSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'The price list {name} was successfully deleted'**
  String priceListDetailsSectionDeleteNotificationSuccessMessage(String name);

  /// No description provided for @priceListDetailsSectionDeleteNotificationErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete price list'**
  String get priceListDetailsSectionDeleteNotificationErrorTitle;

  /// No description provided for @priceListDetailsSectionCustomerGroups.
  ///
  /// In en, this message translates to:
  /// **'Customer Groups'**
  String get priceListDetailsSectionCustomerGroups;

  /// No description provided for @priceListDetailsSectionLastEdited.
  ///
  /// In en, this message translates to:
  /// **'Last edited'**
  String get priceListDetailsSectionLastEdited;

  /// No description provided for @priceListDetailsSectionNumberOfPrices.
  ///
  /// In en, this message translates to:
  /// **'Prices'**
  String get priceListDetailsSectionNumberOfPrices;

  /// No description provided for @priceListDetailsSectionStatusMenuExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get priceListDetailsSectionStatusMenuExpired;

  /// No description provided for @priceListDetailsSectionStatusMenuDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get priceListDetailsSectionStatusMenuDraft;

  /// No description provided for @priceListDetailsSectionStatusMenuScheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get priceListDetailsSectionStatusMenuScheduled;

  /// No description provided for @priceListDetailsSectionStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get priceListDetailsSectionStatusActive;

  /// No description provided for @priceListDetailsSectionStatusMenuNotificationSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated price list status'**
  String get priceListDetailsSectionStatusMenuNotificationSuccessTitle;

  /// No description provided for @priceListDetailsSectionStatusMenuNotificationSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'The price list status was successfully updated to {status}'**
  String priceListDetailsSectionStatusMenuNotificationSuccessMessage(
      String status);

  /// No description provided for @priceListDetailsSectionStatusMenuNotificationErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Failed to update price list status'**
  String get priceListDetailsSectionStatusMenuNotificationErrorTitle;

  /// No description provided for @priceListDetailsSectionStatusMenuItemDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get priceListDetailsSectionStatusMenuItemDraft;

  /// No description provided for @priceListDetailsSectionStatusMenuItemActivate.
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get priceListDetailsSectionStatusMenuItemActivate;

  /// No description provided for @priceListDetailsMenuItemEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit details'**
  String get priceListDetailsMenuItemEdit;

  /// No description provided for @priceListDetailsMenuItemDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get priceListDetailsMenuItemDelete;

  /// No description provided for @priceListEditError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading price list. Reload the page and try again. If the issue persists, try again later.'**
  String get priceListEditError;

  /// No description provided for @priceListNewFormPromptTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get priceListNewFormPromptTitle;

  /// No description provided for @priceListNewFormPromptExitDescription.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes, are you sure you want to exit?'**
  String get priceListNewFormPromptExitDescription;

  /// No description provided for @priceListNewFormPromptBackDescription.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes, are you sure you want to go back?'**
  String get priceListNewFormPromptBackDescription;

  /// No description provided for @priceListAddProductsModalNoPricesError.
  ///
  /// In en, this message translates to:
  /// **'Please assign prices for at least one product.'**
  String get priceListAddProductsModalNoPricesError;

  /// No description provided for @priceListAddProductsModalMissingPricesTitle.
  ///
  /// In en, this message translates to:
  /// **'Incomplete price list'**
  String get priceListAddProductsModalMissingPricesTitle;

  /// No description provided for @priceListAddProductsModalMissingPricesDescription.
  ///
  /// In en, this message translates to:
  /// **'Prices have not been assigned to all of your chosen products. Would you like to continue?'**
  String get priceListAddProductsModalMissingPricesDescription;

  /// No description provided for @priceListAddProductsModalSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'New prices added'**
  String get priceListAddProductsModalSuccessTitle;

  /// No description provided for @priceListAddProductsModalSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'The new prices have been added to the price list.'**
  String get priceListAddProductsModalSuccessMessage;

  /// No description provided for @priceListAddProductsModalErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get priceListAddProductsModalErrorTitle;

  /// No description provided for @priceListAddProductsModalBackButtonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get priceListAddProductsModalBackButtonCancel;

  /// No description provided for @priceListAddProductsModalBackButton.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get priceListAddProductsModalBackButton;

  /// No description provided for @priceListAddProductsModalNextButtonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get priceListAddProductsModalNextButtonContinue;

  /// No description provided for @priceListAddProductsModalNextButtonSubmitAndClose.
  ///
  /// In en, this message translates to:
  /// **'Submit and Close'**
  String get priceListAddProductsModalNextButtonSubmitAndClose;

  /// No description provided for @priceListAddProductsModalNextButtonContinueSavePrices.
  ///
  /// In en, this message translates to:
  /// **'Save Prices'**
  String get priceListAddProductsModalNextButtonContinueSavePrices;

  /// No description provided for @priceListAddProductsModalProductsTab.
  ///
  /// In en, this message translates to:
  /// **'Choose Products'**
  String get priceListAddProductsModalProductsTab;

  /// No description provided for @priceListAddProductsModalPricesTab.
  ///
  /// In en, this message translates to:
  /// **'Edit Prices'**
  String get priceListAddProductsModalPricesTab;

  /// No description provided for @priceListAddProductsModalError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while preparing the form. Reload the page and try again. If the issue persists, try again later.'**
  String get priceListAddProductsModalError;

  /// No description provided for @priceListEditPricesModalPromptTitle.
  ///
  /// In en, this message translates to:
  /// **'Unsaved changes'**
  String get priceListEditPricesModalPromptTitle;

  /// No description provided for @priceListEditPricesModalPromptExitDescription.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes, are you sure you want to exit?'**
  String get priceListEditPricesModalPromptExitDescription;

  /// No description provided for @priceListEditPricesModalPromptBackDescription.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes, are you sure you want to go back?'**
  String get priceListEditPricesModalPromptBackDescription;

  /// No description provided for @priceListEditPricesModalNotificationUpdateError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get priceListEditPricesModalNotificationUpdateError;

  /// No description provided for @priceListEditPricesModalNotificationRemoveErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get priceListEditPricesModalNotificationRemoveErrorTitle;

  /// No description provided for @priceListEditPricesModalNotificationRemoveErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'Some prices were not updated correctly. Try again.'**
  String get priceListEditPricesModalNotificationRemoveErrorDescription;

  /// No description provided for @priceListEditPricesModalNotificationUpdateSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Prices updated'**
  String get priceListEditPricesModalNotificationUpdateSuccessTitle;

  /// No description provided for @priceListEditPricesModalNotificationUpdateSuccessDescription.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated prices'**
  String get priceListEditPricesModalNotificationUpdateSuccessDescription;

  /// No description provided for @priceListEditPricesModalNextButtonSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and Close'**
  String get priceListEditPricesModalNextButtonSaveAndClose;

  /// No description provided for @priceListEditPricesModalNextButtonSave.
  ///
  /// In en, this message translates to:
  /// **'Save Prices'**
  String get priceListEditPricesModalNextButtonSave;

  /// No description provided for @priceListEditPricesModalBackButtonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get priceListEditPricesModalBackButtonCancel;

  /// No description provided for @priceListEditPricesModalBackButtonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get priceListEditPricesModalBackButtonBack;

  /// No description provided for @priceListEditPricesModalOverviewTab.
  ///
  /// In en, this message translates to:
  /// **'Edit Prices'**
  String get priceListEditPricesModalOverviewTab;

  /// No description provided for @priceListEditPricesModalErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while preparing the form. Reload the page and try again. If the issue persists, try again later.'**
  String get priceListEditPricesModalErrorLoading;

  /// No description provided for @priceListPricesSectionPromptTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get priceListPricesSectionPromptTitle;

  /// No description provided for @priceListPricesSectionPromptDescription.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete the product prices from the list'**
  String get priceListPricesSectionPromptDescription;

  /// No description provided for @priceListPricesSectonDeleteSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Prices deleted'**
  String get priceListPricesSectonDeleteSuccessTitle;

  /// No description provided for @priceListPricesSectionDeleteSuccessDescriptionOne.
  ///
  /// In en, this message translates to:
  /// **'Successfully deleted prices for {count} products'**
  String priceListPricesSectionDeleteSuccessDescriptionOne(String count);

  /// No description provided for @priceListPricesSectionDeleteSuccessDescriptionOther.
  ///
  /// In en, this message translates to:
  /// **'Successfully deleted prices for {count} products'**
  String priceListPricesSectionDeleteSuccessDescriptionOther(String count);

  /// No description provided for @priceListPricesSectionDeleteErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get priceListPricesSectionDeleteErrorTitle;

  /// No description provided for @priceListPricesSectionHeading.
  ///
  /// In en, this message translates to:
  /// **'Prices'**
  String get priceListPricesSectionHeading;

  /// No description provided for @priceListPricesSectionSearchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search products'**
  String get priceListPricesSectionSearchPlaceholder;

  /// No description provided for @priceListPricesSectionPricesMenuEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit prices'**
  String get priceListPricesSectionPricesMenuEdit;

  /// No description provided for @priceListPricesSectionPricesMenuAdd.
  ///
  /// In en, this message translates to:
  /// **'Add products'**
  String get priceListPricesSectionPricesMenuAdd;

  /// No description provided for @priceListPricesSectionTableLoadError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while fetching the products. Try to reload the page, or if the issue persists, try again later.'**
  String get priceListPricesSectionTableLoadError;

  /// No description provided for @priceListPricesSectionBarCountOne.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String priceListPricesSectionBarCountOne(String count);

  /// No description provided for @priceListPricesSectionBarCountOther.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String priceListPricesSectionBarCountOther(String count);

  /// No description provided for @priceListPricesSectionEditCommand.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get priceListPricesSectionEditCommand;

  /// No description provided for @priceListPricesSectionDeleteCommand.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get priceListPricesSectionDeleteCommand;

  /// No description provided for @priceListPricesSectionSelectAllCheckboxLabel.
  ///
  /// In en, this message translates to:
  /// **'Select all products on the current page'**
  String get priceListPricesSectionSelectAllCheckboxLabel;

  /// No description provided for @priceListPricesSectionSelectCheckboxLabel.
  ///
  /// In en, this message translates to:
  /// **'Select row'**
  String get priceListPricesSectionSelectCheckboxLabel;

  /// No description provided for @priceListPricesSectionTableProduct.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get priceListPricesSectionTableProduct;

  /// No description provided for @priceListPricesSectionTableThumbnailAlt.
  ///
  /// In en, this message translates to:
  /// **'{title} thumbnail'**
  String priceListPricesSectionTableThumbnailAlt(String title);

  /// No description provided for @priceListPricesSectionTableCollection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get priceListPricesSectionTableCollection;

  /// No description provided for @priceListPricesSectionTableVariants.
  ///
  /// In en, this message translates to:
  /// **'Variants'**
  String get priceListPricesSectionTableVariants;

  /// No description provided for @priceListDetailsFormTypeHeading.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get priceListDetailsFormTypeHeading;

  /// No description provided for @priceListDetailsFormTypeDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose the type of price list you want to create.'**
  String get priceListDetailsFormTypeDescription;

  /// No description provided for @priceListDetailsFormTypeLabelSale.
  ///
  /// In en, this message translates to:
  /// **'Sale'**
  String get priceListDetailsFormTypeLabelSale;

  /// No description provided for @priceListDetailsFormTypeHintSale.
  ///
  /// In en, this message translates to:
  /// **'Use this if you are creating a sale.'**
  String get priceListDetailsFormTypeHintSale;

  /// No description provided for @priceListDetailsFormTypeLabelOverride.
  ///
  /// In en, this message translates to:
  /// **'Override'**
  String get priceListDetailsFormTypeLabelOverride;

  /// No description provided for @priceListDetailsFormTypeHintOverride.
  ///
  /// In en, this message translates to:
  /// **'Use this if you are overriding prices.'**
  String get priceListDetailsFormTypeHintOverride;

  /// No description provided for @priceListDetailsFormGeneralHeading.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get priceListDetailsFormGeneralHeading;

  /// No description provided for @priceListDetailsFormGeneralDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose a title and description for the price list.'**
  String get priceListDetailsFormGeneralDescription;

  /// No description provided for @priceListDetailsFormGeneralNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get priceListDetailsFormGeneralNameLabel;

  /// No description provided for @priceListDetailsFormGeneralNamePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Black Friday Sale'**
  String get priceListDetailsFormGeneralNamePlaceholder;

  /// No description provided for @priceListDetailsFormGeneralDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get priceListDetailsFormGeneralDescriptionLabel;

  /// No description provided for @priceListDetailsFormGeneralDescriptionPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Prices for the Black Friday sale...'**
  String get priceListDetailsFormGeneralDescriptionPlaceholder;

  /// No description provided for @priceListDetailsFormTaxInclusiveLabel.
  ///
  /// In en, this message translates to:
  /// **'Tax inclusive prices'**
  String get priceListDetailsFormTaxInclusiveLabel;

  /// No description provided for @priceListDetailsFormTaxInclusiveHint.
  ///
  /// In en, this message translates to:
  /// **'Choose to make all prices in this list inclusive of tax.'**
  String get priceListDetailsFormTaxInclusiveHint;

  /// No description provided for @priceListDetailsFormDatesStartsAtHeading.
  ///
  /// In en, this message translates to:
  /// **'Price list has a start date?'**
  String get priceListDetailsFormDatesStartsAtHeading;

  /// No description provided for @priceListDetailsFormDatesStartsAtDescription.
  ///
  /// In en, this message translates to:
  /// **'Schedule the price overrides to activate in the future.'**
  String get priceListDetailsFormDatesStartsAtDescription;

  /// No description provided for @priceListDetailsFormDatesStartsAtLabel.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get priceListDetailsFormDatesStartsAtLabel;

  /// No description provided for @priceListDetailsFormEndsAtHeading.
  ///
  /// In en, this message translates to:
  /// **'Price list has an expiry date?'**
  String get priceListDetailsFormEndsAtHeading;

  /// No description provided for @priceListDetailsFormEndsAtDescription.
  ///
  /// In en, this message translates to:
  /// **'Schedule the price overrides to deactivate in the future.'**
  String get priceListDetailsFormEndsAtDescription;

  /// No description provided for @priceListDetailsFormEndsAtLabel.
  ///
  /// In en, this message translates to:
  /// **'Expiry date'**
  String get priceListDetailsFormEndsAtLabel;

  /// No description provided for @priceListDetailsFormCustomerGroupsName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get priceListDetailsFormCustomerGroupsName;

  /// No description provided for @priceListDetailsFormCustomerGroupsMembers.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get priceListDetailsFormCustomerGroupsMembers;

  /// No description provided for @priceListDetailsFormCustomerGroupsError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading customer groups. Reload the page and try again. If the issue persists, try again later.'**
  String get priceListDetailsFormCustomerGroupsError;

  /// No description provided for @priceListDetailsFormCustomerGroupsNoGroups.
  ///
  /// In en, this message translates to:
  /// **'No customer groups found.'**
  String get priceListDetailsFormCustomerGroupsNoGroups;

  /// No description provided for @priceListDetailsFormCustomerGroupsHeading.
  ///
  /// In en, this message translates to:
  /// **'Customer availability'**
  String get priceListDetailsFormCustomerGroupsHeading;

  /// No description provided for @priceListDetailsFormCustomerGroupsDescription.
  ///
  /// In en, this message translates to:
  /// **'Specify which customer groups the price overrides should apply for.'**
  String get priceListDetailsFormCustomerGroupsDescription;

  /// No description provided for @priceListDetailsFormCustomerGroupsContentHeading.
  ///
  /// In en, this message translates to:
  /// **'Customer Groups'**
  String get priceListDetailsFormCustomerGroupsContentHeading;

  /// No description provided for @priceListDetailsFormCustomerGroupsSearchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get priceListDetailsFormCustomerGroupsSearchPlaceholder;

  /// No description provided for @priceListPricesFormProductsError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while preparing the form. Reload the page and try again. If the issue persists, try again later.'**
  String get priceListPricesFormProductsError;

  /// No description provided for @priceListPricesFormHeading.
  ///
  /// In en, this message translates to:
  /// **'Edit prices'**
  String get priceListPricesFormHeading;

  /// No description provided for @priceListPricesFormVariant.
  ///
  /// In en, this message translates to:
  /// **'Variant'**
  String get priceListPricesFormVariant;

  /// No description provided for @priceListPricesFormSku.
  ///
  /// In en, this message translates to:
  /// **'SKU'**
  String get priceListPricesFormSku;

  /// No description provided for @priceListPricesFormPrices.
  ///
  /// In en, this message translates to:
  /// **'Prices'**
  String get priceListPricesFormPrices;

  /// No description provided for @priceListPricesFormPricesVariantCountOne.
  ///
  /// In en, this message translates to:
  /// **'{count} variants'**
  String priceListPricesFormPricesVariantCountOne(String count);

  /// No description provided for @priceListPricesFormPricesVariantCountOther.
  ///
  /// In en, this message translates to:
  /// **'{count} variants'**
  String priceListPricesFormPricesVariantCountOther(String count);

  /// No description provided for @priceListPricesFormAddPricesButton.
  ///
  /// In en, this message translates to:
  /// **'Add prices'**
  String get priceListPricesFormAddPricesButton;

  /// No description provided for @priceListPricesFormPricesCountOne.
  ///
  /// In en, this message translates to:
  /// **'{count} prices'**
  String priceListPricesFormPricesCountOne(String count);

  /// No description provided for @priceListPricesFormPricesCountOther.
  ///
  /// In en, this message translates to:
  /// **'{count} prices'**
  String priceListPricesFormPricesCountOther(String count);

  /// No description provided for @priceListProductPricesFormInvalidDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Invalid data'**
  String get priceListProductPricesFormInvalidDataTitle;

  /// No description provided for @priceListProductPricesFormInvalidDataBody.
  ///
  /// In en, this message translates to:
  /// **'The data you pasted contains values that are not numbers.'**
  String get priceListProductPricesFormInvalidDataBody;

  /// No description provided for @priceListProductPricesFormColumnVisibilityButton.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get priceListProductPricesFormColumnVisibilityButton;

  /// No description provided for @priceListProductPricesFormColumnVisibilityCurrenciesLabel.
  ///
  /// In en, this message translates to:
  /// **'Currencies'**
  String get priceListProductPricesFormColumnVisibilityCurrenciesLabel;

  /// No description provided for @priceListProductPricesFormColumnVisibilityRegionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Regions'**
  String get priceListProductPricesFormColumnVisibilityRegionsLabel;

  /// No description provided for @priceListProductPricesFormColumnProductLabel.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get priceListProductPricesFormColumnProductLabel;

  /// No description provided for @priceListProductPricesFormColumnCurrenciesPriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price {code}'**
  String priceListProductPricesFormColumnCurrenciesPriceLabel(String code);

  /// No description provided for @priceListProductPricesFormColumnRegionsPriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price {name} ({code})'**
  String priceListProductPricesFormColumnRegionsPriceLabel(
      String code, String name);

  /// No description provided for @priceListProductsFormSelectAll.
  ///
  /// In en, this message translates to:
  /// **'Select all products on the current page'**
  String get priceListProductsFormSelectAll;

  /// No description provided for @priceListProductsFormSelectRow.
  ///
  /// In en, this message translates to:
  /// **'Select row'**
  String get priceListProductsFormSelectRow;

  /// No description provided for @priceListProductsFormProductLabel.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get priceListProductsFormProductLabel;

  /// No description provided for @priceListProductsFormProductThumbnail.
  ///
  /// In en, this message translates to:
  /// **'{title} thumbnail'**
  String priceListProductsFormProductThumbnail(String title);

  /// No description provided for @priceListProductsFormCollectionLabel.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get priceListProductsFormCollectionLabel;

  /// No description provided for @priceListProductsFormSalesChannelsLabel.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get priceListProductsFormSalesChannelsLabel;

  /// No description provided for @priceListProductsFormSalesChannelsValue.
  ///
  /// In en, this message translates to:
  /// **'{first} + {remaining} more'**
  String priceListProductsFormSalesChannelsValue(
      String first, String remaining);

  /// No description provided for @priceListProductsFormStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get priceListProductsFormStatusLabel;

  /// No description provided for @priceListProductsFormInventoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get priceListProductsFormInventoryLabel;

  /// No description provided for @priceListProductsFormInventoryValue.
  ///
  /// In en, this message translates to:
  /// **'totalStock in stock across {variants} variants'**
  String priceListProductsFormInventoryValue(
      String totalStock, String variants);

  /// No description provided for @priceListProductsFormLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading products'**
  String get priceListProductsFormLoading;

  /// No description provided for @priceListProductsFormError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading products. Reload the page and try again. If the issue persists, try again later.'**
  String get priceListProductsFormError;

  /// No description provided for @priceListProductsFormNoProducts.
  ///
  /// In en, this message translates to:
  /// **'No products found.'**
  String get priceListProductsFormNoProducts;

  /// No description provided for @priceListProductsFormHeading.
  ///
  /// In en, this message translates to:
  /// **'Choose products'**
  String get priceListProductsFormHeading;

  /// No description provided for @priceListProductsFormSearchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get priceListProductsFormSearchPlaceholder;

  /// No description provided for @priceListNewFormNoPricesError.
  ///
  /// In en, this message translates to:
  /// **'Please set prices for at least one product.'**
  String get priceListNewFormNoPricesError;

  /// No description provided for @priceListNewFormMissingPricesTitle.
  ///
  /// In en, this message translates to:
  /// **'Incomplete price list'**
  String get priceListNewFormMissingPricesTitle;

  /// No description provided for @priceListNewProductsModalMissingPricesDescription.
  ///
  /// In en, this message translates to:
  /// **'Prices have not been assigned to all of your chosen products. Would you like to proceed?'**
  String get priceListNewProductsModalMissingPricesDescription;

  /// No description provided for @priceListNewFormNotificationSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Price list created'**
  String get priceListNewFormNotificationSuccessTitle;

  /// No description provided for @priceListNewFormNotificationSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Successfully created price list'**
  String get priceListNewFormNotificationSuccessMessage;

  /// No description provided for @priceListNewFormNotificationErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get priceListNewFormNotificationErrorTitle;

  /// No description provided for @priceListNewFormNextButtonSaveAndPublish.
  ///
  /// In en, this message translates to:
  /// **'Save and Publish'**
  String get priceListNewFormNextButtonSaveAndPublish;

  /// No description provided for @priceListNewFormNextButtonSave.
  ///
  /// In en, this message translates to:
  /// **'Save Prices'**
  String get priceListNewFormNextButtonSave;

  /// No description provided for @priceListNewFormNextButtonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get priceListNewFormNextButtonContinue;

  /// No description provided for @priceListNewFormBackButtonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get priceListNewFormBackButtonCancel;

  /// No description provided for @priceListNewFormBackButtonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get priceListNewFormBackButtonBack;

  /// No description provided for @priceListNewFormDetailsTab.
  ///
  /// In en, this message translates to:
  /// **'Create Price List'**
  String get priceListNewFormDetailsTab;

  /// No description provided for @priceListNewFormProductsTab.
  ///
  /// In en, this message translates to:
  /// **'Choose Products'**
  String get priceListNewFormProductsTab;

  /// No description provided for @priceListNewFormPricesTab.
  ///
  /// In en, this message translates to:
  /// **'Edit Prices'**
  String get priceListNewFormPricesTab;

  /// No description provided for @priceListNewFormSaveAsDraft.
  ///
  /// In en, this message translates to:
  /// **'Save as Draft'**
  String get priceListNewFormSaveAsDraft;

  /// No description provided for @priceListNewFormErrorLoadingProducts.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while preparing the form. Reload the page and try again. If the issue persists, try again later.'**
  String get priceListNewFormErrorLoadingProducts;

  /// No description provided for @componentsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get componentsSuccess;

  /// No description provided for @componentsSuccessfullyUpdatedCategoryTree.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated category tree'**
  String get componentsSuccessfullyUpdatedCategoryTree;

  /// No description provided for @componentsError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get componentsError;

  /// No description provided for @componentsFailedToUpdateCategoryTree.
  ///
  /// In en, this message translates to:
  /// **'Failed to update category tree'**
  String get componentsFailedToUpdateCategoryTree;

  /// No description provided for @componentsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get componentsDelete;

  /// No description provided for @componentsCategoryDeleted.
  ///
  /// In en, this message translates to:
  /// **'Category deleted'**
  String get componentsCategoryDeleted;

  /// No description provided for @componentsCategoryDeletionFailed.
  ///
  /// In en, this message translates to:
  /// **'Category deletion failed'**
  String get componentsCategoryDeletionFailed;

  /// No description provided for @componentsCategoryStatusIsInactive.
  ///
  /// In en, this message translates to:
  /// **'Category status is inactive'**
  String get componentsCategoryStatusIsInactive;

  /// No description provided for @componentsCategoryVisibilityIsPrivate.
  ///
  /// In en, this message translates to:
  /// **'Category visibility is private'**
  String get componentsCategoryVisibilityIsPrivate;

  /// No description provided for @componentsAddCategoryItemTo.
  ///
  /// In en, this message translates to:
  /// **'Add category item to'**
  String get componentsAddCategoryItemTo;

  /// No description provided for @modalsPublic.
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get modalsPublic;

  /// No description provided for @modalsPrivate.
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get modalsPrivate;

  /// No description provided for @modalsActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get modalsActive;

  /// No description provided for @modalsInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get modalsInactive;

  /// No description provided for @modalsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get modalsSuccess;

  /// No description provided for @modalsSuccessfullyCreatedACategory.
  ///
  /// In en, this message translates to:
  /// **'Successfully created a category'**
  String get modalsSuccessfullyCreatedACategory;

  /// No description provided for @modalsFailedToCreateANewCategory.
  ///
  /// In en, this message translates to:
  /// **'Failed to create a new category'**
  String get modalsFailedToCreateANewCategory;

  /// No description provided for @modalsError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get modalsError;

  /// No description provided for @modalsSaveCategory.
  ///
  /// In en, this message translates to:
  /// **'Save category'**
  String get modalsSaveCategory;

  /// No description provided for @modalsAddCategoryTo.
  ///
  /// In en, this message translates to:
  /// **'Add category to {name}'**
  String modalsAddCategoryTo(String name);

  /// No description provided for @modalsAddCategory.
  ///
  /// In en, this message translates to:
  /// **'Add category'**
  String get modalsAddCategory;

  /// No description provided for @modalsDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get modalsDetails;

  /// No description provided for @modalsName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get modalsName;

  /// No description provided for @modalsGiveThisCategoryAName.
  ///
  /// In en, this message translates to:
  /// **'Give this category a name'**
  String get modalsGiveThisCategoryAName;

  /// No description provided for @modalsHandle.
  ///
  /// In en, this message translates to:
  /// **'Handle'**
  String get modalsHandle;

  /// No description provided for @modalsCustomHandle.
  ///
  /// In en, this message translates to:
  /// **'Custom handle'**
  String get modalsCustomHandle;

  /// No description provided for @modalsDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get modalsDescription;

  /// No description provided for @modalsGiveThisCategoryADescription.
  ///
  /// In en, this message translates to:
  /// **'Give this category a description'**
  String get modalsGiveThisCategoryADescription;

  /// No description provided for @modalsStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get modalsStatus;

  /// No description provided for @modalsVisibility.
  ///
  /// In en, this message translates to:
  /// **'Visibility'**
  String get modalsVisibility;

  /// No description provided for @modalsSuccessfullyUpdatedTheCategory.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated the category'**
  String get modalsSuccessfullyUpdatedTheCategory;

  /// No description provided for @modalsFailedToUpdateTheCategory.
  ///
  /// In en, this message translates to:
  /// **'Failed to update the category'**
  String get modalsFailedToUpdateTheCategory;

  /// No description provided for @modalsEditProductCategory.
  ///
  /// In en, this message translates to:
  /// **'Edit product category'**
  String get modalsEditProductCategory;

  /// No description provided for @modalsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get modalsCancel;

  /// No description provided for @modalsSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get modalsSaveAndClose;

  /// No description provided for @pagesNoProductCategoriesYet.
  ///
  /// In en, this message translates to:
  /// **'No product categories yet, use the above button to create your first category.'**
  String get pagesNoProductCategoriesYet;

  /// No description provided for @pagesAddCategory.
  ///
  /// In en, this message translates to:
  /// **'Add category'**
  String get pagesAddCategory;

  /// No description provided for @pagesProductCategories.
  ///
  /// In en, this message translates to:
  /// **'Product Categories'**
  String get pagesProductCategories;

  /// No description provided for @pagesHelpsYouToKeepYourProductsOrganized.
  ///
  /// In en, this message translates to:
  /// **'Helps you to keep your products organized.'**
  String get pagesHelpsYouToKeepYourProductsOrganized;

  /// No description provided for @batchJobSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get batchJobSuccess;

  /// No description provided for @batchJobImportConfirmedForProcessingProgressInfoIsAvailableInTheActivityDrawer.
  ///
  /// In en, this message translates to:
  /// **'Import confirmed for processing. Progress info is available in the activity drawer.'**
  String
      get batchJobImportConfirmedForProcessingProgressInfoIsAvailableInTheActivityDrawer;

  /// No description provided for @batchJobError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get batchJobError;

  /// No description provided for @batchJobImportFailed.
  ///
  /// In en, this message translates to:
  /// **'Import failed.'**
  String get batchJobImportFailed;

  /// No description provided for @batchJobFailedToDeleteTheCsvFile.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete the CSV file'**
  String get batchJobFailedToDeleteTheCsvFile;

  /// No description provided for @batchJobFailedToCancelTheBatchJob.
  ///
  /// In en, this message translates to:
  /// **'Failed to cancel the batch job'**
  String get batchJobFailedToCancelTheBatchJob;

  /// No description provided for @batchJobProductsList.
  ///
  /// In en, this message translates to:
  /// **'products list'**
  String get batchJobProductsList;

  /// No description provided for @batchJobUnsureAboutHowToArrangeYourList.
  ///
  /// In en, this message translates to:
  /// **'Unsure about how to arrange your list?'**
  String get batchJobUnsureAboutHowToArrangeYourList;

  /// No description provided for @batchJobDownloadTemplate.
  ///
  /// In en, this message translates to:
  /// **'Download the template below to ensure you are following the correct format.'**
  String get batchJobDownloadTemplate;

  /// No description provided for @batchJobImportsDescription.
  ///
  /// In en, this message translates to:
  /// **'Through imports you can add or update products. To update existing products/variants you must set an existing id in the Product/Variant id columns. If the value is unset a new record will be created. You will be asked for confirmation before we import products.'**
  String get batchJobImportsDescription;

  /// No description provided for @productsFilters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get productsFilters;

  /// No description provided for @productsStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get productsStatus;

  /// No description provided for @productsTags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get productsTags;

  /// No description provided for @productsSpringSummer.
  ///
  /// In en, this message translates to:
  /// **'Spring, summer...'**
  String get productsSpringSummer;

  /// No description provided for @newSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Sales channels'**
  String get newSalesChannels;

  /// No description provided for @newThisProductWillOnlyBeAvailableInTheDefaultSalesChannelIfLeftUntouched.
  ///
  /// In en, this message translates to:
  /// **'This product will only be available in the default sales channel if left untouched.'**
  String
      get newThisProductWillOnlyBeAvailableInTheDefaultSalesChannelIfLeftUntouched;

  /// No description provided for @newChangeAvailablity.
  ///
  /// In en, this message translates to:
  /// **'Change availablity'**
  String get newChangeAvailablity;

  /// No description provided for @addVariantsAVariantWithTheseOptionsAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'A variant with these options already exists.'**
  String get addVariantsAVariantWithTheseOptionsAlreadyExists;

  /// No description provided for @addVariantsProductOptions.
  ///
  /// In en, this message translates to:
  /// **'Product options'**
  String get addVariantsProductOptions;

  /// No description provided for @addVariantsOptionsAreUsedToDefineTheColorSizeEtcOfTheProduct.
  ///
  /// In en, this message translates to:
  /// **'Options are used to define the color, size, etc. of the product.'**
  String get addVariantsOptionsAreUsedToDefineTheColorSizeEtcOfTheProduct;

  /// No description provided for @addVariantsOptionTitle.
  ///
  /// In en, this message translates to:
  /// **'Option title'**
  String get addVariantsOptionTitle;

  /// No description provided for @addVariantsVariationsCommaSeparated.
  ///
  /// In en, this message translates to:
  /// **'Variations (comma separated)'**
  String get addVariantsVariationsCommaSeparated;

  /// No description provided for @addVariantsColor.
  ///
  /// In en, this message translates to:
  /// **'Color...'**
  String get addVariantsColor;

  /// No description provided for @addVariantsAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'already exists'**
  String get addVariantsAlreadyExists;

  /// No description provided for @addVariantsBlueRedBlack.
  ///
  /// In en, this message translates to:
  /// **'Blue, Red, Black...'**
  String get addVariantsBlueRedBlack;

  /// No description provided for @addVariantsAddAnOption.
  ///
  /// In en, this message translates to:
  /// **'Add an option'**
  String get addVariantsAddAnOption;

  /// No description provided for @addVariantsProductVariants.
  ///
  /// In en, this message translates to:
  /// **'Product variants'**
  String get addVariantsProductVariants;

  /// No description provided for @addVariantsYouMustAddAtLeastOneProductOptionBeforeYouCanBeginAddingProductVariants.
  ///
  /// In en, this message translates to:
  /// **'You must add at least one product option before you can begin adding product variants.'**
  String
      get addVariantsYouMustAddAtLeastOneProductOptionBeforeYouCanBeginAddingProductVariants;

  /// No description provided for @addVariantsVariant.
  ///
  /// In en, this message translates to:
  /// **'Variant'**
  String get addVariantsVariant;

  /// No description provided for @addVariantsInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get addVariantsInventory;

  /// No description provided for @addVariantsAddAVariant.
  ///
  /// In en, this message translates to:
  /// **'Add a variant'**
  String get addVariantsAddAVariant;

  /// No description provided for @addVariantsCreateVariant.
  ///
  /// In en, this message translates to:
  /// **'Create Variant'**
  String get addVariantsCreateVariant;

  /// No description provided for @addVariantsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get addVariantsCancel;

  /// No description provided for @addVariantsSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get addVariantsSaveAndClose;

  /// No description provided for @newVariantAVariantWithTheseOptionsAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'A variant with these options already exists.'**
  String get newVariantAVariantWithTheseOptionsAlreadyExists;

  /// No description provided for @newVariantAreYouSureYouWantToDeleteThisVariant.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this variant?'**
  String get newVariantAreYouSureYouWantToDeleteThisVariant;

  /// No description provided for @newVariantDeleteVariant.
  ///
  /// In en, this message translates to:
  /// **'Delete Variant'**
  String get newVariantDeleteVariant;

  /// No description provided for @newVariantEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get newVariantEdit;

  /// No description provided for @newVariantDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get newVariantDelete;

  /// No description provided for @newVariantEditVariant.
  ///
  /// In en, this message translates to:
  /// **'Edit Variant'**
  String get newVariantEditVariant;

  /// No description provided for @newVariantCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get newVariantCancel;

  /// No description provided for @newVariantSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get newVariantSaveAndClose;

  /// No description provided for @newSomethingWentWrongWhileTryingToUploadImages.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while trying to upload images.'**
  String get newSomethingWentWrongWhileTryingToUploadImages;

  /// No description provided for @newNoFileServiceConfigured.
  ///
  /// In en, this message translates to:
  /// **'You might not have a file service configured. Please contact your administrator'**
  String get newNoFileServiceConfigured;

  /// No description provided for @newUploadThumbnailError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while trying to upload the thumbnail.'**
  String get newUploadThumbnailError;

  /// No description provided for @newSaveAsDraft.
  ///
  /// In en, this message translates to:
  /// **'Save as draft'**
  String get newSaveAsDraft;

  /// No description provided for @newPublishProduct.
  ///
  /// In en, this message translates to:
  /// **'Publish product'**
  String get newPublishProduct;

  /// No description provided for @newGeneralInformationTitle.
  ///
  /// In en, this message translates to:
  /// **'General information'**
  String get newGeneralInformationTitle;

  /// No description provided for @newToStartSellingAllYouNeedIsANameAndAPrice.
  ///
  /// In en, this message translates to:
  /// **'To start selling, all you need is a name and a price.'**
  String get newToStartSellingAllYouNeedIsANameAndAPrice;

  /// No description provided for @newOrganizeProduct.
  ///
  /// In en, this message translates to:
  /// **'Organize Product'**
  String get newOrganizeProduct;

  /// No description provided for @newAddVariationsOfThisProduct.
  ///
  /// In en, this message translates to:
  /// **'Add variations of this product.'**
  String get newAddVariationsOfThisProduct;

  /// No description provided for @newOfferYourCustomersDifferentOptionsForColorFormatSizeShapeEtc.
  ///
  /// In en, this message translates to:
  /// **'Offer your customers different options for color, format, size, shape, etc.'**
  String get newOfferYourCustomersDifferentOptionsForColorFormatSizeShapeEtc;

  /// No description provided for @newUsedForShippingAndCustomsPurposes.
  ///
  /// In en, this message translates to:
  /// **'Used for shipping and customs purposes.'**
  String get newUsedForShippingAndCustomsPurposes;

  /// No description provided for @newDimensions.
  ///
  /// In en, this message translates to:
  /// **'Dimensions'**
  String get newDimensions;

  /// No description provided for @newCustoms.
  ///
  /// In en, this message translates to:
  /// **'Customs'**
  String get newCustoms;

  /// No description provided for @newUsedToRepresentYourProductDuringCheckoutSocialSharingAndMore.
  ///
  /// In en, this message translates to:
  /// **'Used to represent your product during checkout, social sharing and more.'**
  String get newUsedToRepresentYourProductDuringCheckoutSocialSharingAndMore;

  /// No description provided for @newMedia.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get newMedia;

  /// No description provided for @newAddImagesToYourProduct.
  ///
  /// In en, this message translates to:
  /// **'Add images to your product.'**
  String get newAddImagesToYourProduct;

  /// No description provided for @overviewImportProducts.
  ///
  /// In en, this message translates to:
  /// **'Import Products'**
  String get overviewImportProducts;

  /// No description provided for @overviewExportProducts.
  ///
  /// In en, this message translates to:
  /// **'Export Products'**
  String get overviewExportProducts;

  /// No description provided for @overviewNewProduct.
  ///
  /// In en, this message translates to:
  /// **'New Product'**
  String get overviewNewProduct;

  /// No description provided for @overviewNewCollection.
  ///
  /// In en, this message translates to:
  /// **'New Collection'**
  String get overviewNewCollection;

  /// No description provided for @overviewSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get overviewSuccess;

  /// No description provided for @overviewSuccessfullyCreatedCollection.
  ///
  /// In en, this message translates to:
  /// **'Successfully created collection'**
  String get overviewSuccessfullyCreatedCollection;

  /// No description provided for @overviewError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get overviewError;

  /// No description provided for @overviewSuccessfullyInitiatedExport.
  ///
  /// In en, this message translates to:
  /// **'Successfully initiated export'**
  String get overviewSuccessfullyInitiatedExport;

  /// No description provided for @modalsAddSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Add sales channels'**
  String get modalsAddSalesChannels;

  /// No description provided for @modalsFindChannels.
  ///
  /// In en, this message translates to:
  /// **'Find channels'**
  String get modalsFindChannels;

  /// No description provided for @modalsUpdatedTheApiKey.
  ///
  /// In en, this message translates to:
  /// **'Updated the API key'**
  String get modalsUpdatedTheApiKey;

  /// No description provided for @modalsFailedToUpdateTheApiKey.
  ///
  /// In en, this message translates to:
  /// **'Failed to update the API key'**
  String get modalsFailedToUpdateTheApiKey;

  /// No description provided for @modalsEditApiKeyDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit API key details'**
  String get modalsEditApiKeyDetails;

  /// No description provided for @modalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get modalsTitle;

  /// No description provided for @modalsNameYourKey.
  ///
  /// In en, this message translates to:
  /// **'Name your key'**
  String get modalsNameYourKey;

  /// No description provided for @modalsSalesChannelsAddedToTheScope.
  ///
  /// In en, this message translates to:
  /// **'Sales channels added to the scope'**
  String get modalsSalesChannelsAddedToTheScope;

  /// No description provided for @modalsErrorOccurredWhileAddingSalesChannelsToTheScopeOfTheKey.
  ///
  /// In en, this message translates to:
  /// **'Error occurred while adding sales channels to the scope of the key'**
  String get modalsErrorOccurredWhileAddingSalesChannelsToTheScopeOfTheKey;

  /// No description provided for @modalsAddAndGoBack.
  ///
  /// In en, this message translates to:
  /// **'Add and go back'**
  String get modalsAddAndGoBack;

  /// No description provided for @modalsAddAndClose.
  ///
  /// In en, this message translates to:
  /// **'Add and close'**
  String get modalsAddAndClose;

  /// No description provided for @modalsSalesChannelsRemovedFromTheScope.
  ///
  /// In en, this message translates to:
  /// **'Sales channels removed from the scope'**
  String get modalsSalesChannelsRemovedFromTheScope;

  /// No description provided for @modalsErrorOccurredWhileRemovingSalesChannelsFromTheScopeOfTheKey.
  ///
  /// In en, this message translates to:
  /// **'Error occurred while removing sales channels from the scope of the key'**
  String get modalsErrorOccurredWhileRemovingSalesChannelsFromTheScopeOfTheKey;

  /// No description provided for @modalsEditSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Edit sales channels'**
  String get modalsEditSalesChannels;

  /// No description provided for @publishableApiKeysModalsManageSalesChannelsSelectedWithCountsOne.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String publishableApiKeysModalsManageSalesChannelsSelectedWithCountsOne(
      String count);

  /// No description provided for @publishableApiKeysModalsManageSalesChannelsSelectedWithCountsOther.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String publishableApiKeysModalsManageSalesChannelsSelectedWithCountsOther(
      String count);

  /// No description provided for @modalsDeselect.
  ///
  /// In en, this message translates to:
  /// **'Deselect'**
  String get modalsDeselect;

  /// No description provided for @modalsRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get modalsRemove;

  /// No description provided for @modalsAddChannels.
  ///
  /// In en, this message translates to:
  /// **'Add channels'**
  String get modalsAddChannels;

  /// No description provided for @modalsClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get modalsClose;

  /// No description provided for @pagesSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Sales channels'**
  String get pagesSalesChannels;

  /// No description provided for @pagesConnectAsManySalesChannelsToYourApiKeyAsYouNeed.
  ///
  /// In en, this message translates to:
  /// **'Connect as many sales channels to your API key as you need.'**
  String get pagesConnectAsManySalesChannelsToYourApiKeyAsYouNeed;

  /// No description provided for @pagesAddSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Add sales channels'**
  String get pagesAddSalesChannels;

  /// No description provided for @pagesEditSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Edit sales channels'**
  String get pagesEditSalesChannels;

  /// No description provided for @pagesSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get pagesSuccess;

  /// No description provided for @pagesCreatedANewApiKey.
  ///
  /// In en, this message translates to:
  /// **'Created a new API key'**
  String get pagesCreatedANewApiKey;

  /// No description provided for @pagesError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get pagesError;

  /// No description provided for @pagesFailedToCreateANewApiKey.
  ///
  /// In en, this message translates to:
  /// **'Failed to create a new API key'**
  String get pagesFailedToCreateANewApiKey;

  /// No description provided for @pagesSalesChannelsAddedToTheScope.
  ///
  /// In en, this message translates to:
  /// **'Sales channels added to the scope'**
  String get pagesSalesChannelsAddedToTheScope;

  /// No description provided for @pagesErrorOccurredWhileAddingSalesChannelsToTheScopeOfTheKey.
  ///
  /// In en, this message translates to:
  /// **'Error occurred while adding sales channels to the scope of the key'**
  String get pagesErrorOccurredWhileAddingSalesChannelsToTheScopeOfTheKey;

  /// No description provided for @pagesPublishApiKey.
  ///
  /// In en, this message translates to:
  /// **'Publish API key'**
  String get pagesPublishApiKey;

  /// No description provided for @pagesCreateApiKey.
  ///
  /// In en, this message translates to:
  /// **'Create API Key'**
  String get pagesCreateApiKey;

  /// No description provided for @pagesCreateAndManageApiKeysRightNowThisIsOnlyRelatedToSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Create and manage API keys. Right now this is only related to sales channels.'**
  String
      get pagesCreateAndManageApiKeysRightNowThisIsOnlyRelatedToSalesChannels;

  /// No description provided for @pagesCreateApiKeyLabel.
  ///
  /// In en, this message translates to:
  /// **'Create API key'**
  String get pagesCreateApiKeyLabel;

  /// No description provided for @pagesBackToSettings.
  ///
  /// In en, this message translates to:
  /// **'Back to settings'**
  String get pagesBackToSettings;

  /// No description provided for @pagesPublishableApiKeys.
  ///
  /// In en, this message translates to:
  /// **'Publishable API keys'**
  String get pagesPublishableApiKeys;

  /// No description provided for @pagesThesePublishableKeysWillAllowYouToAuthenticateApiRequests.
  ///
  /// In en, this message translates to:
  /// **'These publishable keys will allow you to authenticate API requests.'**
  String get pagesThesePublishableKeysWillAllowYouToAuthenticateApiRequests;

  /// No description provided for @tablesName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get tablesName;

  /// No description provided for @tablesToken.
  ///
  /// In en, this message translates to:
  /// **'Token'**
  String get tablesToken;

  /// No description provided for @tablesDone.
  ///
  /// In en, this message translates to:
  /// **'done'**
  String get tablesDone;

  /// No description provided for @tablesCopyToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy to clipboard'**
  String get tablesCopyToClipboard;

  /// No description provided for @tablesCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get tablesCreated;

  /// No description provided for @tablesStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get tablesStatus;

  /// No description provided for @tablesRevoked.
  ///
  /// In en, this message translates to:
  /// **'Revoked'**
  String get tablesRevoked;

  /// No description provided for @tablesLive.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get tablesLive;

  /// No description provided for @tablesEditApiKeyDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit API key details'**
  String get tablesEditApiKeyDetails;

  /// No description provided for @tablesEditSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Edit sales channels'**
  String get tablesEditSalesChannels;

  /// No description provided for @tablesCopyToken.
  ///
  /// In en, this message translates to:
  /// **'Copy token'**
  String get tablesCopyToken;

  /// No description provided for @tablesRevokeToken.
  ///
  /// In en, this message translates to:
  /// **'Revoke token'**
  String get tablesRevokeToken;

  /// No description provided for @tablesDeleteApiKey.
  ///
  /// In en, this message translates to:
  /// **'Delete API key'**
  String get tablesDeleteApiKey;

  /// No description provided for @tablesYesDelete.
  ///
  /// In en, this message translates to:
  /// **'Yes, delete'**
  String get tablesYesDelete;

  /// No description provided for @tablesApiKeyDeleted.
  ///
  /// In en, this message translates to:
  /// **'API key deleted'**
  String get tablesApiKeyDeleted;

  /// No description provided for @tablesAreYouSureYouWantToDeleteThisPublicKey.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this public key?'**
  String get tablesAreYouSureYouWantToDeleteThisPublicKey;

  /// No description provided for @tablesDeleteKey.
  ///
  /// In en, this message translates to:
  /// **'Delete key'**
  String get tablesDeleteKey;

  /// No description provided for @tablesYesRevoke.
  ///
  /// In en, this message translates to:
  /// **'Yes, revoke'**
  String get tablesYesRevoke;

  /// No description provided for @tablesApiKeyRevoked.
  ///
  /// In en, this message translates to:
  /// **'API key revoked'**
  String get tablesApiKeyRevoked;

  /// No description provided for @tablesAreYouSureYouWantToRevokeThisPublicKey.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to revoke this public key?'**
  String get tablesAreYouSureYouWantToRevokeThisPublicKey;

  /// No description provided for @tablesRevokeKey.
  ///
  /// In en, this message translates to:
  /// **'Revoke key'**
  String get tablesRevokeKey;

  /// No description provided for @tablesApiKeys.
  ///
  /// In en, this message translates to:
  /// **'API Keys'**
  String get tablesApiKeys;

  /// No description provided for @tablesNoKeysYetUseTheAboveButtonToCreateYourFirstPublishableKey.
  ///
  /// In en, this message translates to:
  /// **'No keys yet, use the above button to create your first publishable key'**
  String get tablesNoKeysYetUseTheAboveButtonToCreateYourFirstPublishableKey;

  /// No description provided for @tablesTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get tablesTitle;

  /// No description provided for @tablesDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get tablesDescription;

  /// No description provided for @tablesNoAddedSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'No added sales channels'**
  String get tablesNoAddedSalesChannels;

  /// No description provided for @tablesSalesChannels.
  ///
  /// In en, this message translates to:
  /// **'Sales Channels'**
  String get tablesSalesChannels;

  /// No description provided for @formTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get formTitle;

  /// No description provided for @formWebsiteAppAmazonPhysicalStorePosFacebookProductFeed.
  ///
  /// In en, this message translates to:
  /// **'Website, app, Amazon, physical store POS, facebook product feed...'**
  String get formWebsiteAppAmazonPhysicalStorePosFacebookProductFeed;

  /// No description provided for @formDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get formDescription;

  /// No description provided for @formAvailableProductsAtOurWebsiteApp.
  ///
  /// In en, this message translates to:
  /// **'Available products at our website, app...'**
  String get formAvailableProductsAtOurWebsiteApp;

  /// No description provided for @formSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get formSuccess;

  /// No description provided for @formTheSalesChannelIsSuccessfullyUpdated.
  ///
  /// In en, this message translates to:
  /// **'The sales channel is successfully updated'**
  String get formTheSalesChannelIsSuccessfullyUpdated;

  /// No description provided for @formError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get formError;

  /// No description provided for @formFailedToUpdateTheSalesChannel.
  ///
  /// In en, this message translates to:
  /// **'Failed to update the sales channel'**
  String get formFailedToUpdateTheSalesChannel;

  /// No description provided for @formSalesChannelDetails.
  ///
  /// In en, this message translates to:
  /// **'Sales channel details'**
  String get formSalesChannelDetails;

  /// No description provided for @formGeneralInfo.
  ///
  /// In en, this message translates to:
  /// **'General info'**
  String get formGeneralInfo;

  /// No description provided for @formName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get formName;

  /// No description provided for @formClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get formClose;

  /// No description provided for @formSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get formSave;

  /// No description provided for @pagesDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get pagesDraft;

  /// No description provided for @pagesControlWhichProductsAreAvailableInWhichChannels.
  ///
  /// In en, this message translates to:
  /// **'Control which products are available in which channels'**
  String get pagesControlWhichProductsAreAvailableInWhichChannels;

  /// No description provided for @pagesSearchByTitleOrDescription.
  ///
  /// In en, this message translates to:
  /// **'Search by title or description'**
  String get pagesSearchByTitleOrDescription;

  /// No description provided for @pagesConfirmDeleteSalesChannel.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this sales channel? The setup you made will be gone forever.'**
  String get pagesConfirmDeleteSalesChannel;

  /// No description provided for @pagesDeleteChannelHeading.
  ///
  /// In en, this message translates to:
  /// **'Delete Channel'**
  String get pagesDeleteChannelHeading;

  /// No description provided for @pagesEditGeneralInfo.
  ///
  /// In en, this message translates to:
  /// **'Edit general info'**
  String get pagesEditGeneralInfo;

  /// No description provided for @pagesAddProducts.
  ///
  /// In en, this message translates to:
  /// **'Add products'**
  String get pagesAddProducts;

  /// No description provided for @pagesDeleteChannel.
  ///
  /// In en, this message translates to:
  /// **'Delete channel'**
  String get pagesDeleteChannel;

  /// No description provided for @pagesDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get pagesDisabled;

  /// No description provided for @pagesEnabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get pagesEnabled;

  /// No description provided for @tablesCollection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get tablesCollection;

  /// No description provided for @tablesStartBuildingYourChannelsSetup.
  ///
  /// In en, this message translates to:
  /// **'Start building your channels setup...'**
  String get tablesStartBuildingYourChannelsSetup;

  /// No description provided for @tablesNoProductsInChannels.
  ///
  /// In en, this message translates to:
  /// **'You haven’t added any products to this channels yet, but once you do they will live here.'**
  String get tablesNoProductsInChannels;

  /// No description provided for @tablesAddProducts.
  ///
  /// In en, this message translates to:
  /// **'Add products'**
  String get tablesAddProducts;

  /// No description provided for @tablesDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get tablesDetails;

  /// No description provided for @tablesRemoveFromTheChannel.
  ///
  /// In en, this message translates to:
  /// **'Remove from the channel'**
  String get tablesRemoveFromTheChannel;

  /// No description provided for @tablesProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get tablesProducts;

  /// No description provided for @salesChannelsTablePlaceholderSelectedWithCountsOne.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String salesChannelsTablePlaceholderSelectedWithCountsOne(String count);

  /// No description provided for @salesChannelsTablePlaceholderSelectedWithCountsOther.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String salesChannelsTablePlaceholderSelectedWithCountsOther(String count);

  /// No description provided for @tablesRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get tablesRemove;

  /// No description provided for @componentsSuccessfullyUpdatedCurrency.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated currency'**
  String get componentsSuccessfullyUpdatedCurrency;

  /// No description provided for @componentsDefault.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get componentsDefault;

  /// No description provided for @defaultStoreCurrencySuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get defaultStoreCurrencySuccess;

  /// No description provided for @defaultStoreCurrencySuccessfullyUpdatedDefaultCurrency.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated default currency'**
  String get defaultStoreCurrencySuccessfullyUpdatedDefaultCurrency;

  /// No description provided for @defaultStoreCurrencyError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get defaultStoreCurrencyError;

  /// No description provided for @defaultStoreCurrencyDefaultStoreCurrency.
  ///
  /// In en, this message translates to:
  /// **'Default store currency'**
  String get defaultStoreCurrencyDefaultStoreCurrency;

  /// No description provided for @defaultStoreCurrencyThisIsTheCurrencyYourPricesAreShownIn.
  ///
  /// In en, this message translates to:
  /// **'This is the currency your prices are shown in.'**
  String get defaultStoreCurrencyThisIsTheCurrencyYourPricesAreShownIn;

  /// No description provided for @storeCurrenciesSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get storeCurrenciesSuccess;

  /// No description provided for @storeCurrenciesSuccessfullyUpdatedCurrencies.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated currencies'**
  String get storeCurrenciesSuccessfullyUpdatedCurrencies;

  /// No description provided for @storeCurrenciesError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get storeCurrenciesError;

  /// No description provided for @storeCurrenciesCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get storeCurrenciesCancel;

  /// No description provided for @storeCurrenciesSaveAndGoBack.
  ///
  /// In en, this message translates to:
  /// **'Save and go back'**
  String get storeCurrenciesSaveAndGoBack;

  /// No description provided for @storeCurrenciesSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get storeCurrenciesSaveAndClose;

  /// No description provided for @storeCurrenciesAddStoreCurrencies.
  ///
  /// In en, this message translates to:
  /// **'Add Store Currencies'**
  String get storeCurrenciesAddStoreCurrencies;

  /// No description provided for @storeCurrenciesCurrentStoreCurrencies.
  ///
  /// In en, this message translates to:
  /// **'Current Store Currencies'**
  String get storeCurrenciesCurrentStoreCurrencies;

  /// No description provided for @storeCurrenciesClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get storeCurrenciesClose;

  /// No description provided for @currentCurrenciesScreenSelectedWithCountOne.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String currentCurrenciesScreenSelectedWithCountOne(String count);

  /// No description provided for @currentCurrenciesScreenSelectedWithCountOther.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String currentCurrenciesScreenSelectedWithCountOther(String count);

  /// No description provided for @storeCurrenciesDeselect.
  ///
  /// In en, this message translates to:
  /// **'Deselect'**
  String get storeCurrenciesDeselect;

  /// No description provided for @storeCurrenciesRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get storeCurrenciesRemove;

  /// No description provided for @storeCurrenciesAddCurrencies.
  ///
  /// In en, this message translates to:
  /// **'Add Currencies'**
  String get storeCurrenciesAddCurrencies;

  /// No description provided for @storeCurrenciesStoreCurrencies.
  ///
  /// In en, this message translates to:
  /// **'Store currencies'**
  String get storeCurrenciesStoreCurrencies;

  /// No description provided for @storeCurrenciesAllTheCurrenciesAvailableInYourStore.
  ///
  /// In en, this message translates to:
  /// **'All the currencies available in your store.'**
  String get storeCurrenciesAllTheCurrenciesAvailableInYourStore;

  /// No description provided for @storeCurrenciesEditCurrencies.
  ///
  /// In en, this message translates to:
  /// **'Edit currencies'**
  String get storeCurrenciesEditCurrencies;

  /// No description provided for @currenciesAnUnknownErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred'**
  String get currenciesAnUnknownErrorOccurred;

  /// No description provided for @currenciesError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get currenciesError;

  /// No description provided for @currenciesBackToSettings.
  ///
  /// In en, this message translates to:
  /// **'Back to Settings'**
  String get currenciesBackToSettings;

  /// No description provided for @currenciesManageTheMarketsThatYouWillOperateWithin.
  ///
  /// In en, this message translates to:
  /// **'Manage the markets that you will operate within.'**
  String get currenciesManageTheMarketsThatYouWillOperateWithin;

  /// No description provided for @currenciesIncludeOrExcludeTaxes.
  ///
  /// In en, this message translates to:
  /// **'Decide if you want to include or exclude taxes whenever you define a price in this currency'**
  String get currenciesIncludeOrExcludeTaxes;

  /// No description provided for @currenciesTaxInclPrices.
  ///
  /// In en, this message translates to:
  /// **'Tax Incl. Prices'**
  String get currenciesTaxInclPrices;

  /// No description provided for @settingsError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get settingsError;

  /// No description provided for @settingsMalformedSwapUrl.
  ///
  /// In en, this message translates to:
  /// **'Malformed swap url'**
  String get settingsMalformedSwapUrl;

  /// No description provided for @settingsMalformedPaymentUrl.
  ///
  /// In en, this message translates to:
  /// **'Malformed payment url'**
  String get settingsMalformedPaymentUrl;

  /// No description provided for @settingsMalformedInviteUrl.
  ///
  /// In en, this message translates to:
  /// **'Malformed invite url'**
  String get settingsMalformedInviteUrl;

  /// No description provided for @settingsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get settingsSuccess;

  /// No description provided for @settingsSuccessfullyUpdatedStore.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated store'**
  String get settingsSuccessfullyUpdatedStore;

  /// No description provided for @settingsBackToSettings.
  ///
  /// In en, this message translates to:
  /// **'Back to settings'**
  String get settingsBackToSettings;

  /// No description provided for @settingsSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get settingsSave;

  /// No description provided for @settingsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get settingsCancel;

  /// No description provided for @settingsStoreDetails.
  ///
  /// In en, this message translates to:
  /// **'Store Details'**
  String get settingsStoreDetails;

  /// No description provided for @settingsManageYourBusinessDetails.
  ///
  /// In en, this message translates to:
  /// **'Manage your business details'**
  String get settingsManageYourBusinessDetails;

  /// No description provided for @settingsGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settingsGeneral;

  /// No description provided for @settingsStoreName.
  ///
  /// In en, this message translates to:
  /// **'Store name'**
  String get settingsStoreName;

  /// No description provided for @settingsMedusaStore.
  ///
  /// In en, this message translates to:
  /// **'Medusa Store'**
  String get settingsMedusaStore;

  /// No description provided for @settingsAdvancedSettings.
  ///
  /// In en, this message translates to:
  /// **'Advanced settings'**
  String get settingsAdvancedSettings;

  /// No description provided for @settingsSwapLinkTemplate.
  ///
  /// In en, this message translates to:
  /// **'Swap link template'**
  String get settingsSwapLinkTemplate;

  /// No description provided for @settingsDraftOrderLinkTemplate.
  ///
  /// In en, this message translates to:
  /// **'Draft order link template'**
  String get settingsDraftOrderLinkTemplate;

  /// No description provided for @settingsInviteLinkTemplate.
  ///
  /// In en, this message translates to:
  /// **'Invite link template'**
  String get settingsInviteLinkTemplate;

  /// No description provided for @settingsManageTheGeneralSettingsForYourStore.
  ///
  /// In en, this message translates to:
  /// **'Manage the general settings for your store'**
  String get settingsManageTheGeneralSettingsForYourStore;

  /// No description provided for @settingsManageTheSettingsForYourStoreAposSExtensions.
  ///
  /// In en, this message translates to:
  /// **'Manage the settings for your store extensions'**
  String get settingsManageTheSettingsForYourStoreAposSExtensions;

  /// No description provided for @editUserInformationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get editUserInformationSuccess;

  /// No description provided for @editUserInformationYourInformationWasSuccessfullyUpdated.
  ///
  /// In en, this message translates to:
  /// **'Your information was successfully updated'**
  String get editUserInformationYourInformationWasSuccessfullyUpdated;

  /// No description provided for @editUserInformationEditInformation.
  ///
  /// In en, this message translates to:
  /// **'Edit information'**
  String get editUserInformationEditInformation;

  /// No description provided for @editUserInformationCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get editUserInformationCancel;

  /// No description provided for @editUserInformationSubmitAndClose.
  ///
  /// In en, this message translates to:
  /// **'Submit and close'**
  String get editUserInformationSubmitAndClose;

  /// No description provided for @personalInformationBackToSettings.
  ///
  /// In en, this message translates to:
  /// **'Back to Settings'**
  String get personalInformationBackToSettings;

  /// No description provided for @personalInformationPersonalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get personalInformationPersonalInformation;

  /// No description provided for @personalInformationManageYourMedusaProfile.
  ///
  /// In en, this message translates to:
  /// **'Manage your Medusa profile'**
  String get personalInformationManageYourMedusaProfile;

  /// No description provided for @personalInformationLanguageSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get personalInformationLanguageSettingsTitle;

  /// No description provided for @personalInformationLanguageSettingsDescription.
  ///
  /// In en, this message translates to:
  /// **'Adjust the language of Medusa Admin'**
  String get personalInformationLanguageSettingsDescription;

  /// No description provided for @personalInformationLanguageSettingsHelpUsTranslate.
  ///
  /// In en, this message translates to:
  /// **'Help us translate'**
  String get personalInformationLanguageSettingsHelpUsTranslate;

  /// No description provided for @personalInformationUsageInsightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Usage insights'**
  String get personalInformationUsageInsightsTitle;

  /// No description provided for @usageInsightsDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get usageInsightsDisabled;

  /// No description provided for @usageInsightsActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get usageInsightsActive;

  /// No description provided for @usageInsightsShareUsageInsightsAndHelpUsImproveMedusa.
  ///
  /// In en, this message translates to:
  /// **'Share usage insights and help us improve Medusa'**
  String get usageInsightsShareUsageInsightsAndHelpUsImproveMedusa;

  /// No description provided for @usageInsightsEditPreferences.
  ///
  /// In en, this message translates to:
  /// **'Edit preferences'**
  String get usageInsightsEditPreferences;

  /// No description provided for @usageInsightsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get usageInsightsSuccess;

  /// No description provided for @usageInsightsYourInformationWasSuccessfullyUpdated.
  ///
  /// In en, this message translates to:
  /// **'Your information was successfully updated'**
  String get usageInsightsYourInformationWasSuccessfullyUpdated;

  /// No description provided for @usageInsightsError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get usageInsightsError;

  /// No description provided for @usageInsightsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get usageInsightsCancel;

  /// No description provided for @usageInsightsSubmitAndClose.
  ///
  /// In en, this message translates to:
  /// **'Submit and close'**
  String get usageInsightsSubmitAndClose;

  /// No description provided for @regionFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get regionFormTitle;

  /// No description provided for @regionFormEurope.
  ///
  /// In en, this message translates to:
  /// **'Europe'**
  String get regionFormEurope;

  /// No description provided for @regionFormCurrencyCodeIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Currency code is required'**
  String get regionFormCurrencyCodeIsRequired;

  /// No description provided for @regionFormCurrency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get regionFormCurrency;

  /// No description provided for @regionFormChooseCurrency.
  ///
  /// In en, this message translates to:
  /// **'Choose currency'**
  String get regionFormChooseCurrency;

  /// No description provided for @regionFormDefaultTaxRate.
  ///
  /// In en, this message translates to:
  /// **'Default Tax Rate'**
  String get regionFormDefaultTaxRate;

  /// No description provided for @regionFormTaxRateIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Tax rate is required'**
  String get regionFormTaxRateIsRequired;

  /// No description provided for @regionFormTaxRateMustBeEqualToOrLessThan100.
  ///
  /// In en, this message translates to:
  /// **'Tax rate must be equal to or less than 100'**
  String get regionFormTaxRateMustBeEqualToOrLessThan100;

  /// No description provided for @regionFormDefaultTaxCode.
  ///
  /// In en, this message translates to:
  /// **'Default Tax Code'**
  String get regionFormDefaultTaxCode;

  /// No description provided for @regionFormCountries.
  ///
  /// In en, this message translates to:
  /// **'Countries'**
  String get regionFormCountries;

  /// No description provided for @regionFormChooseCountries.
  ///
  /// In en, this message translates to:
  /// **'Choose countries'**
  String get regionFormChooseCountries;

  /// No description provided for @regionFormTaxInclusivePrices.
  ///
  /// In en, this message translates to:
  /// **'Tax inclusive prices'**
  String get regionFormTaxInclusivePrices;

  /// No description provided for @regionFormWhenEnabledRegionPricesWillBeTaxInclusive.
  ///
  /// In en, this message translates to:
  /// **'When enabled region prices will be tax inclusive.'**
  String get regionFormWhenEnabledRegionPricesWillBeTaxInclusive;

  /// No description provided for @regionFormPaymentProvidersAreRequired.
  ///
  /// In en, this message translates to:
  /// **'Payment providers are required'**
  String get regionFormPaymentProvidersAreRequired;

  /// No description provided for @regionFormPaymentProviders.
  ///
  /// In en, this message translates to:
  /// **'Payment Providers'**
  String get regionFormPaymentProviders;

  /// No description provided for @regionFormChoosePaymentProviders.
  ///
  /// In en, this message translates to:
  /// **'Choose payment providers...'**
  String get regionFormChoosePaymentProviders;

  /// No description provided for @regionFormFulfillmentProvidersAreRequired.
  ///
  /// In en, this message translates to:
  /// **'Fulfillment providers are required'**
  String get regionFormFulfillmentProvidersAreRequired;

  /// No description provided for @regionFormFulfillmentProviders.
  ///
  /// In en, this message translates to:
  /// **'Fulfillment Providers'**
  String get regionFormFulfillmentProviders;

  /// No description provided for @regionFormChooseFulfillmentProviders.
  ///
  /// In en, this message translates to:
  /// **'Choose fulfillment providers...'**
  String get regionFormChooseFulfillmentProviders;

  /// No description provided for @shippingOptionCardSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get shippingOptionCardSuccess;

  /// No description provided for @shippingOptionCardShippingOptionUpdated.
  ///
  /// In en, this message translates to:
  /// **'Shipping option updated'**
  String get shippingOptionCardShippingOptionUpdated;

  /// No description provided for @shippingOptionCardError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get shippingOptionCardError;

  /// No description provided for @shippingOptionCardEditShippingOption.
  ///
  /// In en, this message translates to:
  /// **'Edit Shipping Option'**
  String get shippingOptionCardEditShippingOption;

  /// No description provided for @shippingOptionCardFulfillmentMethod.
  ///
  /// In en, this message translates to:
  /// **'Fulfillment Method'**
  String get shippingOptionCardFulfillmentMethod;

  /// No description provided for @shippingOptionCardCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get shippingOptionCardCancel;

  /// No description provided for @shippingOptionCardSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get shippingOptionCardSaveAndClose;

  /// No description provided for @shippingOptionCardShippingOptionHasBeenDeleted.
  ///
  /// In en, this message translates to:
  /// **'Shipping option has been deleted'**
  String get shippingOptionCardShippingOptionHasBeenDeleted;

  /// No description provided for @shippingOptionCardFlatRate.
  ///
  /// In en, this message translates to:
  /// **'Flat Rate'**
  String get shippingOptionCardFlatRate;

  /// No description provided for @shippingOptionCardCalcualted.
  ///
  /// In en, this message translates to:
  /// **'Calculated'**
  String get shippingOptionCardCalcualted;

  /// No description provided for @shippingOptionCardMinSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Min. subtotal:'**
  String get shippingOptionCardMinSubtotal;

  /// No description provided for @shippingOptionCardMaxSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Max. subtotal:'**
  String get shippingOptionCardMaxSubtotal;

  /// No description provided for @shippingOptionCardAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get shippingOptionCardAdmin;

  /// No description provided for @shippingOptionCardStore.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get shippingOptionCardStore;

  /// No description provided for @shippingOptionCardEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get shippingOptionCardEdit;

  /// No description provided for @shippingOptionCardDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get shippingOptionCardDelete;

  /// No description provided for @shippingOptionFormVisibleInStore.
  ///
  /// In en, this message translates to:
  /// **'Visible in store'**
  String get shippingOptionFormVisibleInStore;

  /// No description provided for @shippingOptionFormEnableOrDisableTheShippingOptionVisiblityInStore.
  ///
  /// In en, this message translates to:
  /// **'Enable or disable the shipping option visiblity in store.'**
  String get shippingOptionFormEnableOrDisableTheShippingOptionVisiblityInStore;

  /// No description provided for @shippingOptionFormDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get shippingOptionFormDetails;

  /// No description provided for @shippingOptionFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get shippingOptionFormTitle;

  /// No description provided for @shippingOptionFormTitleIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Title is required'**
  String get shippingOptionFormTitleIsRequired;

  /// No description provided for @shippingOptionFormPriceType.
  ///
  /// In en, this message translates to:
  /// **'Price Type'**
  String get shippingOptionFormPriceType;

  /// No description provided for @shippingOptionFormFlatRate.
  ///
  /// In en, this message translates to:
  /// **'Flat Rate'**
  String get shippingOptionFormFlatRate;

  /// No description provided for @shippingOptionFormCalculated.
  ///
  /// In en, this message translates to:
  /// **'Calculated'**
  String get shippingOptionFormCalculated;

  /// No description provided for @shippingOptionFormChooseAPriceType.
  ///
  /// In en, this message translates to:
  /// **'Choose a price type'**
  String get shippingOptionFormChooseAPriceType;

  /// No description provided for @shippingOptionFormPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get shippingOptionFormPrice;

  /// No description provided for @shippingOptionFormShippingProfile.
  ///
  /// In en, this message translates to:
  /// **'Shipping Profile'**
  String get shippingOptionFormShippingProfile;

  /// No description provided for @shippingOptionFormChooseAShippingProfile.
  ///
  /// In en, this message translates to:
  /// **'Choose a shipping profile'**
  String get shippingOptionFormChooseAShippingProfile;

  /// No description provided for @shippingOptionFormFulfillmentMethod.
  ///
  /// In en, this message translates to:
  /// **'Fulfillment Method'**
  String get shippingOptionFormFulfillmentMethod;

  /// No description provided for @shippingOptionFormChooseAFulfillmentMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose a fulfillment method'**
  String get shippingOptionFormChooseAFulfillmentMethod;

  /// No description provided for @shippingOptionFormRequirements.
  ///
  /// In en, this message translates to:
  /// **'Requirements'**
  String get shippingOptionFormRequirements;

  /// No description provided for @shippingOptionFormMinSubtotalMustBeLessThanMaxSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Min. subtotal must be less than max. subtotal'**
  String get shippingOptionFormMinSubtotalMustBeLessThanMaxSubtotal;

  /// No description provided for @shippingOptionFormMinSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Min. subtotal'**
  String get shippingOptionFormMinSubtotal;

  /// No description provided for @shippingOptionFormMaxSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Max. subtotal'**
  String get shippingOptionFormMaxSubtotal;

  /// No description provided for @shippingOptionFormMetadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get shippingOptionFormMetadata;

  /// No description provided for @generalSectionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get generalSectionSuccess;

  /// No description provided for @generalSectionRegionWasSuccessfullyUpdated.
  ///
  /// In en, this message translates to:
  /// **'Region was successfully updated'**
  String get generalSectionRegionWasSuccessfullyUpdated;

  /// No description provided for @generalSectionError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get generalSectionError;

  /// No description provided for @generalSectionEditRegionDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit Region Details'**
  String get generalSectionEditRegionDetails;

  /// No description provided for @generalSectionDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get generalSectionDetails;

  /// No description provided for @generalSectionProviders.
  ///
  /// In en, this message translates to:
  /// **'Providers'**
  String get generalSectionProviders;

  /// No description provided for @generalSectionMetadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get generalSectionMetadata;

  /// No description provided for @generalSectionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get generalSectionCancel;

  /// No description provided for @generalSectionSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get generalSectionSaveAndClose;

  /// No description provided for @editSomethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong...'**
  String get editSomethingWentWrong;

  /// No description provided for @editNoRegionFound.
  ///
  /// In en, this message translates to:
  /// **'We can\'t find a region with that ID, use the menu to the left to select a region.'**
  String get editNoRegionFound;

  /// No description provided for @returnShippingOptionsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get returnShippingOptionsSuccess;

  /// No description provided for @returnShippingOptionsShippingOptionCreated.
  ///
  /// In en, this message translates to:
  /// **'Shipping option created'**
  String get returnShippingOptionsShippingOptionCreated;

  /// No description provided for @returnShippingOptionsError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get returnShippingOptionsError;

  /// No description provided for @returnShippingOptionsAddReturnShippingOption.
  ///
  /// In en, this message translates to:
  /// **'Add Return Shipping Option'**
  String get returnShippingOptionsAddReturnShippingOption;

  /// No description provided for @returnShippingOptionsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get returnShippingOptionsCancel;

  /// No description provided for @returnShippingOptionsSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get returnShippingOptionsSaveAndClose;

  /// No description provided for @returnShippingOptionsReturnShippingOptions.
  ///
  /// In en, this message translates to:
  /// **'Return Shipping Options'**
  String get returnShippingOptionsReturnShippingOptions;

  /// No description provided for @returnShippingOptionsAddOption.
  ///
  /// In en, this message translates to:
  /// **'Add Option'**
  String get returnShippingOptionsAddOption;

  /// No description provided for @returnShippingOptionsEnterSpecificsAboutAvailableRegionalReturnShipmentMethods.
  ///
  /// In en, this message translates to:
  /// **'Enter specifics about available regional return shipment methods.'**
  String
      get returnShippingOptionsEnterSpecificsAboutAvailableRegionalReturnShipmentMethods;

  /// No description provided for @shippingOptionsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get shippingOptionsSuccess;

  /// No description provided for @shippingOptionsShippingOptionCreated.
  ///
  /// In en, this message translates to:
  /// **'Shipping option created'**
  String get shippingOptionsShippingOptionCreated;

  /// No description provided for @shippingOptionsError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get shippingOptionsError;

  /// No description provided for @shippingOptionsAddShippingOption.
  ///
  /// In en, this message translates to:
  /// **'Add Shipping Option'**
  String get shippingOptionsAddShippingOption;

  /// No description provided for @shippingOptionsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get shippingOptionsCancel;

  /// No description provided for @shippingOptionsSaveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get shippingOptionsSaveAndClose;

  /// No description provided for @shippingOptionsShippingOptions.
  ///
  /// In en, this message translates to:
  /// **'Shipping Options'**
  String get shippingOptionsShippingOptions;

  /// No description provided for @shippingOptionsAddOption.
  ///
  /// In en, this message translates to:
  /// **'Add Option'**
  String get shippingOptionsAddOption;

  /// No description provided for @shippingOptionsEnterSpecificsAboutAvailableRegionalShipmentMethods.
  ///
  /// In en, this message translates to:
  /// **'Enter specifics about available regional shipment methods.'**
  String get shippingOptionsEnterSpecificsAboutAvailableRegionalShipmentMethods;

  /// No description provided for @newRegionCreated.
  ///
  /// In en, this message translates to:
  /// **'Region created'**
  String get newRegionCreated;

  /// No description provided for @newCreateRegion.
  ///
  /// In en, this message translates to:
  /// **'Create region'**
  String get newCreateRegion;

  /// No description provided for @newDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get newDetails;

  /// No description provided for @newAddTheRegionDetails.
  ///
  /// In en, this message translates to:
  /// **'Add the region details.'**
  String get newAddTheRegionDetails;

  /// No description provided for @newProviders.
  ///
  /// In en, this message translates to:
  /// **'Providers'**
  String get newProviders;

  /// No description provided for @newAddWhichFulfillmentAndPaymentProvidersShouldBeAvailableInThisRegion.
  ///
  /// In en, this message translates to:
  /// **'Add which fulfillment and payment providers should be available in this region.'**
  String
      get newAddWhichFulfillmentAndPaymentProvidersShouldBeAvailableInThisRegion;

  /// No description provided for @regionOverviewRegions.
  ///
  /// In en, this message translates to:
  /// **'Regions'**
  String get regionOverviewRegions;

  /// No description provided for @regionOverviewManageTheMarketsThatYouWillOperateWithin.
  ///
  /// In en, this message translates to:
  /// **'Manage the markets that you will operate within.'**
  String get regionOverviewManageTheMarketsThatYouWillOperateWithin;

  /// No description provided for @regionOverviewNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'Not configured'**
  String get regionOverviewNotConfigured;

  /// No description provided for @regionOverviewFulfillmentProviders.
  ///
  /// In en, this message translates to:
  /// **'Fulfillment providers:'**
  String get regionOverviewFulfillmentProviders;

  /// No description provided for @returnReasonsNotificationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get returnReasonsNotificationSuccess;

  /// No description provided for @returnReasonsCreatedANewReturnReason.
  ///
  /// In en, this message translates to:
  /// **'Created a new return reason'**
  String get returnReasonsCreatedANewReturnReason;

  /// No description provided for @returnReasonsSuccess.
  ///
  /// In en, this message translates to:
  /// **'success'**
  String get returnReasonsSuccess;

  /// No description provided for @returnReasonsError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get returnReasonsError;

  /// No description provided for @returnReasonsCannotCreateAReturnReasonWithAnExistingValue.
  ///
  /// In en, this message translates to:
  /// **'Cannot create a return reason with an existing value'**
  String get returnReasonsCannotCreateAReturnReasonWithAnExistingValue;

  /// No description provided for @returnReasonsAddReason.
  ///
  /// In en, this message translates to:
  /// **'Add Reason'**
  String get returnReasonsAddReason;

  /// No description provided for @returnReasonsValueIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Value is required'**
  String get returnReasonsValueIsRequired;

  /// No description provided for @returnReasonsValue.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get returnReasonsValue;

  /// No description provided for @returnReasonsLabelIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Label is required'**
  String get returnReasonsLabelIsRequired;

  /// No description provided for @returnReasonsLabel.
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get returnReasonsLabel;

  /// No description provided for @returnReasonsDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get returnReasonsDescription;

  /// No description provided for @returnReasonsCustomerReceivedTheWrongSize.
  ///
  /// In en, this message translates to:
  /// **'Customer received the wrong size'**
  String get returnReasonsCustomerReceivedTheWrongSize;

  /// No description provided for @returnReasonsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get returnReasonsCancel;

  /// No description provided for @returnReasonsCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get returnReasonsCreate;

  /// No description provided for @returnReasonsSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get returnReasonsSuccessTitle;

  /// No description provided for @returnReasonsSuccessfullyUpdatedReturnReason.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated return reason'**
  String get returnReasonsSuccessfullyUpdatedReturnReason;

  /// No description provided for @returnReasonsDuplicateReason.
  ///
  /// In en, this message translates to:
  /// **'Duplicate reason'**
  String get returnReasonsDuplicateReason;

  /// No description provided for @returnReasonsDeleteReason.
  ///
  /// In en, this message translates to:
  /// **'Delete reason'**
  String get returnReasonsDeleteReason;

  /// No description provided for @returnReasonsSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get returnReasonsSave;

  /// No description provided for @returnReasonsDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get returnReasonsDetails;

  /// No description provided for @returnReasonsDeleteReturnReason.
  ///
  /// In en, this message translates to:
  /// **'Delete Return Reason'**
  String get returnReasonsDeleteReturnReason;

  /// No description provided for @returnReasonsAreYouSureYouWantToDeleteThisReturnReason.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this return reason?'**
  String get returnReasonsAreYouSureYouWantToDeleteThisReturnReason;

  /// No description provided for @returnReasonsBackToSettings.
  ///
  /// In en, this message translates to:
  /// **'Back to settings'**
  String get returnReasonsBackToSettings;

  /// No description provided for @returnReasonsReturnReasons.
  ///
  /// In en, this message translates to:
  /// **'Return Reasons'**
  String get returnReasonsReturnReasons;

  /// No description provided for @returnReasonsAddReasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Add reason'**
  String get returnReasonsAddReasonLabel;

  /// No description provided for @returnReasonsManageReasonsForReturnedItems.
  ///
  /// In en, this message translates to:
  /// **'Manage reasons for returned items'**
  String get returnReasonsManageReasonsForReturnedItems;

  /// No description provided for @taxesDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get taxesDetails;

  /// No description provided for @taxesNewTaxRate.
  ///
  /// In en, this message translates to:
  /// **'New Tax Rate'**
  String get taxesNewTaxRate;

  /// No description provided for @taxesTaxCalculationSettings.
  ///
  /// In en, this message translates to:
  /// **'Tax Calculation Settings'**
  String get taxesTaxCalculationSettings;

  /// No description provided for @taxesSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get taxesSuccess;

  /// No description provided for @taxesSuccessfullyUpdatedTaxRate.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated Tax Rate.'**
  String get taxesSuccessfullyUpdatedTaxRate;

  /// No description provided for @taxesError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get taxesError;

  /// No description provided for @taxesOverrides.
  ///
  /// In en, this message translates to:
  /// **'Overrides'**
  String get taxesOverrides;

  /// No description provided for @taxesProductRules.
  ///
  /// In en, this message translates to:
  /// **'Product Rules'**
  String get taxesProductRules;

  /// No description provided for @taxesProductRulesDescriptionOne.
  ///
  /// In en, this message translates to:
  /// **'Applies to {count} productWithCount'**
  String taxesProductRulesDescriptionOne(String count);

  /// No description provided for @taxesProductRulesDescriptionOther.
  ///
  /// In en, this message translates to:
  /// **'Applies to {count} productWithCount'**
  String taxesProductRulesDescriptionOther(String count);

  /// No description provided for @taxesProductTypeRules.
  ///
  /// In en, this message translates to:
  /// **'Product Type Rules'**
  String get taxesProductTypeRules;

  /// No description provided for @taxesProductTypeRulesDescriptionOne.
  ///
  /// In en, this message translates to:
  /// **'Applies to {count} product typeWithCount'**
  String taxesProductTypeRulesDescriptionOne(String count);

  /// No description provided for @taxesProductTypeRulesDescriptionOther.
  ///
  /// In en, this message translates to:
  /// **'Applies to {count} product typeWithCount'**
  String taxesProductTypeRulesDescriptionOther(String count);

  /// No description provided for @taxesShippingOptionRules.
  ///
  /// In en, this message translates to:
  /// **'Shipping Option Rules'**
  String get taxesShippingOptionRules;

  /// No description provided for @taxesAppliesToShippingOptionWithCountOne.
  ///
  /// In en, this message translates to:
  /// **'Applies to {count} shipping optionWithCount'**
  String taxesAppliesToShippingOptionWithCountOne(String count);

  /// No description provided for @taxesAppliesToShippingOptionWithCountOther.
  ///
  /// In en, this message translates to:
  /// **'Applies to {count} shipping optionWithCount'**
  String taxesAppliesToShippingOptionWithCountOther(String count);

  /// No description provided for @taxesAddOverrides.
  ///
  /// In en, this message translates to:
  /// **'Add Overrides'**
  String get taxesAddOverrides;

  /// No description provided for @taxesCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get taxesCancel;

  /// No description provided for @taxesSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get taxesSave;

  /// No description provided for @taxesName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get taxesName;

  /// No description provided for @taxesDefault.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get taxesDefault;

  /// No description provided for @taxesRateName.
  ///
  /// In en, this message translates to:
  /// **'Rate name'**
  String get taxesRateName;

  /// No description provided for @taxesTaxRate.
  ///
  /// In en, this message translates to:
  /// **'Tax Rate'**
  String get taxesTaxRate;

  /// No description provided for @taxesTaxCode.
  ///
  /// In en, this message translates to:
  /// **'Tax Code'**
  String get taxesTaxCode;

  /// No description provided for @taxesEditTaxRate.
  ///
  /// In en, this message translates to:
  /// **'Edit Tax Rate'**
  String get taxesEditTaxRate;

  /// No description provided for @taxesBackToSettings.
  ///
  /// In en, this message translates to:
  /// **'Back to settings'**
  String get taxesBackToSettings;

  /// No description provided for @taxesRegions.
  ///
  /// In en, this message translates to:
  /// **'Regions'**
  String get taxesRegions;

  /// No description provided for @taxesSelectTheRegionYouWishToManageTaxesFor.
  ///
  /// In en, this message translates to:
  /// **'Select the region you wish to manage taxes for'**
  String get taxesSelectTheRegionYouWishToManageTaxesFor;

  /// No description provided for @taxesGoToRegionSettings.
  ///
  /// In en, this message translates to:
  /// **'Go to Region settings'**
  String get taxesGoToRegionSettings;

  /// No description provided for @taxesSuccessfullyCreatedTaxRate.
  ///
  /// In en, this message translates to:
  /// **'Successfully created tax rate.'**
  String get taxesSuccessfullyCreatedTaxRate;

  /// No description provided for @taxesAddTaxRate.
  ///
  /// In en, this message translates to:
  /// **'Add Tax Rate'**
  String get taxesAddTaxRate;

  /// No description provided for @taxesAppliesToProductTypeWithCountOne.
  ///
  /// In en, this message translates to:
  /// **'Applies to {count} product typeWithCount'**
  String taxesAppliesToProductTypeWithCountOne(String count);

  /// No description provided for @taxesAppliesToProductTypeWithCountOther.
  ///
  /// In en, this message translates to:
  /// **'Applies to {count} product typeWithCount'**
  String taxesAppliesToProductTypeWithCountOther(String count);

  /// No description provided for @taxesCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get taxesCreate;

  /// No description provided for @taxesSelectProducts.
  ///
  /// In en, this message translates to:
  /// **'Select Products'**
  String get taxesSelectProducts;

  /// No description provided for @taxesSelectProductTypesLabel.
  ///
  /// In en, this message translates to:
  /// **'Select Product Types'**
  String get taxesSelectProductTypesLabel;

  /// No description provided for @taxesProductTypes.
  ///
  /// In en, this message translates to:
  /// **'Product Types'**
  String get taxesProductTypes;

  /// No description provided for @taxesSystemTaxProvider.
  ///
  /// In en, this message translates to:
  /// **'System Tax Provider'**
  String get taxesSystemTaxProvider;

  /// No description provided for @taxesRegionTaxSettingsWereSuccessfullyUpdated.
  ///
  /// In en, this message translates to:
  /// **'Region tax settings were successfully updated.'**
  String get taxesRegionTaxSettingsWereSuccessfullyUpdated;

  /// No description provided for @taxesTaxProvider.
  ///
  /// In en, this message translates to:
  /// **'Tax Provider'**
  String get taxesTaxProvider;

  /// No description provided for @taxesCalculateTaxesAutomatically.
  ///
  /// In en, this message translates to:
  /// **'Calculate taxes automatically?'**
  String get taxesCalculateTaxesAutomatically;

  /// No description provided for @taxesAutomaticallyApplyTaxCalculationsToCarts.
  ///
  /// In en, this message translates to:
  /// **'When checked Medusa will automatically apply tax calculations to Carts in this Region. When unchecked you will have to manually compute taxes at checkout. Manual taxes are recommended if using a 3rd party tax provider to avoid performing too many requests'**
  String get taxesAutomaticallyApplyTaxCalculationsToCarts;

  /// No description provided for @taxesApplyTaxToGiftCards.
  ///
  /// In en, this message translates to:
  /// **'Apply tax to gift cards?'**
  String get taxesApplyTaxToGiftCards;

  /// No description provided for @taxesApplyTaxesToGiftCards.
  ///
  /// In en, this message translates to:
  /// **'When checked taxes will be applied to gift cards on checkout. In some contries tax regulations require that taxes are applied to gift cards on purchase.'**
  String get taxesApplyTaxesToGiftCards;

  /// No description provided for @taxesSearchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search Products..'**
  String get taxesSearchProducts;

  /// No description provided for @taxesSelectShippingOption.
  ///
  /// In en, this message translates to:
  /// **'Select Shipping Option'**
  String get taxesSelectShippingOption;

  /// No description provided for @taxesShippingOptions.
  ///
  /// In en, this message translates to:
  /// **'Shipping Options'**
  String get taxesShippingOptions;

  /// No description provided for @taxesDeleteTaxRateHeading.
  ///
  /// In en, this message translates to:
  /// **'Delete tax rate'**
  String get taxesDeleteTaxRateHeading;

  /// No description provided for @taxesConfirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this tax rate?'**
  String get taxesConfirmDelete;

  /// No description provided for @taxesTaxRateWasDeleted.
  ///
  /// In en, this message translates to:
  /// **'Tax rate was deleted.'**
  String get taxesTaxRateWasDeleted;

  /// No description provided for @taxesEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get taxesEdit;

  /// No description provided for @taxesDeleteTaxRate.
  ///
  /// In en, this message translates to:
  /// **'Delete Tax Rate'**
  String get taxesDeleteTaxRate;

  /// No description provided for @taxesDeleteRule.
  ///
  /// In en, this message translates to:
  /// **'Delete rule'**
  String get taxesDeleteRule;

  /// No description provided for @taxesType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get taxesType;

  /// No description provided for @taxesProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get taxesProducts;

  /// No description provided for @taxesSelectIndividualProducts.
  ///
  /// In en, this message translates to:
  /// **'Select individual products'**
  String get taxesSelectIndividualProducts;

  /// No description provided for @taxesSelectProductTypes.
  ///
  /// In en, this message translates to:
  /// **'Select product types'**
  String get taxesSelectProductTypes;

  /// No description provided for @taxesSelectShippingOptions.
  ///
  /// In en, this message translates to:
  /// **'Select shipping options'**
  String get taxesSelectShippingOptions;

  /// No description provided for @taxesBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get taxesBack;

  /// No description provided for @taxesAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get taxesAdd;

  /// No description provided for @taxesCode.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get taxesCode;

  /// No description provided for @usersInviteUsers.
  ///
  /// In en, this message translates to:
  /// **'Invite Users'**
  String get usersInviteUsers;

  /// No description provided for @usersBackToSettings.
  ///
  /// In en, this message translates to:
  /// **'Back to settings'**
  String get usersBackToSettings;

  /// No description provided for @usersTheTeam.
  ///
  /// In en, this message translates to:
  /// **'The Team'**
  String get usersTheTeam;

  /// No description provided for @usersManageUsersOfYourMedusaStore.
  ///
  /// In en, this message translates to:
  /// **'Manage users of your Medusa Store'**
  String get usersManageUsersOfYourMedusaStore;

  /// No description provided for @usersCountOne.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String usersCountOne(String count);

  /// No description provided for @usersCountOther.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String usersCountOther(String count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
