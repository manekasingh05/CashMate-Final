import 'package:cashmate_vscode/components/CurvedNavBarGame.dart';
import 'package:cashmate_vscode/components/CurvedNavBarMoneyLock.dart';
import 'package:cashmate_vscode/components/Theme2/White_CurvedNavBar.dart';
import 'package:cashmate_vscode/components/Theme3/White_CurvedNavBar.dart';
import 'package:cashmate_vscode/components/White_CurvedNavBar.dart';
import 'package:cashmate_vscode/pages/homepage.dart';
import 'package:cashmate_vscode/pages/loginPage.dart';
import 'package:cashmate_vscode/pages/payUsers.dart';
import 'package:cashmate_vscode/pages/payWithWallet.dart';
import 'package:cashmate_vscode/pages/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:cashmate_vscode/pages/splash_screen.dart';
import 'package:cashmate_vscode/pages/activity.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:cashmate_vscode/pages/custom_paint.dart';
import 'package:cashmate_vscode/components/configuration.dart';
import 'package:cashmate_vscode/pages/Cards.dart';
import 'package:cashmate_vscode/pages/addCard.dart';
import 'package:cashmate_vscode/pages/sendNotification.dart';
import 'package:cashmate_vscode/pages/notification.dart';
import 'package:cashmate_vscode/services/local_notifications.dart';
import 'package:cashmate_vscode/pages/userDetails.dart';
import 'package:cashmate_vscode/pages/addBank.dart';
import 'package:cashmate_vscode/pages/bankDetails.dart';
import 'package:cashmate_vscode/pages/paymentsucces.dart';
import 'package:cashmate_vscode/pages/addMoneyinWallet.dart';
import 'package:cashmate_vscode/pages/selectContacts.dart';
import 'package:cashmate_vscode/pages/settings.dart';
import 'package:cashmate_vscode/pages/chat.dart';
import 'package:cashmate_vscode/pages/askMoney.dart';
import 'package:cashmate_vscode/pages/changePassword.dart';
import 'package:cashmate_vscode/pages/invite.dart';
import 'package:cashmate_vscode/pages/forgotPassword.dart';
import 'package:cashmate_vscode/themes/changePassword_theme2.dart';
import 'package:cashmate_vscode/themes/changePassword_theme3.dart';
import 'package:cashmate_vscode/themes/chat_theme2.dart';
import 'package:cashmate_vscode/themes/chat_theme3.dart';
import 'package:cashmate_vscode/themes/homepage_theme2.dart';
import 'package:cashmate_vscode/themes/homepage_theme3.dart';
import 'package:cashmate_vscode/themes/selectContacts_theme2.dart';
import 'package:cashmate_vscode/themes/selectContacts_theme3.dart';
import 'package:cashmate_vscode/themes/sendNotifications_theme2.dart';
import 'package:cashmate_vscode/themes/sendNotifications_theme3.dart';
import 'package:cashmate_vscode/themes/settings_theme2.dart';
import 'package:cashmate_vscode/themes/settings_theme3.dart';
import 'package:cashmate_vscode/pages/theme_1.dart';
import 'package:cashmate_vscode/pages/theme_2.dart';
import 'package:cashmate_vscode/pages/theme_3.dart';
import 'package:cashmate_vscode/pages/transactionHistory.dart';
import 'package:cashmate_vscode/pages/create_budget.dart';
import 'package:cashmate_vscode/pages/budgetPlanner.dart';
import 'package:cashmate_vscode/pages/currencyExchange.dart';
import 'package:cashmate_vscode/pages/moneyLock.dart';
import 'package:cashmate_vscode/pages/edit_MoneyLocked.dart';
import 'package:cashmate_vscode/pages/game_levels.dart';
import 'package:cashmate_vscode/pages/gaming.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';




Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      routes: {
         MyRoutes.splashRoute : (context) => WelcomeScreen(),
         MyRoutes.loginRoute : (context) => MyLogin(),
         MyRoutes.homeRoute : (context) => HomeScreen(),
         MyRoutes.registerRoute : (context) => MyRegister(),
         MyRoutes.activityRoute : (context) =>  MyActivityScreen(),
         MyRoutes.cardsRoute : (context) => MyCardScreen(),
         MyRoutes.addCardRoute: (context) => CardPage(),
         MyRoutes.notificationRoute : (context) => NotificationScreen(),
         MyRoutes.sendnotificationRoute : (context) => SendNotificationScreen(title: 'Flutter Local Notifications'),
         MyRoutes.userdetailsRoute : (context) => CreateProfile(),
         MyRoutes.addBankRoute : (context) => addBank(),
         MyRoutes.bankDetailsRoute : (context) => bankDetails(),
         MyRoutes.successRoute : (context) => TransactionSuccessView(),
         MyRoutes.addMoneyinWalletRoute : (context) => SendMoneyPage(),
         MyRoutes.selectContacts : (context) => SelectContacts(),
         MyRoutes.settingsRoute : (context) => SettingsPageUI(),
         MyRoutes.chatRoute : (context) => ChatPage(),
         MyRoutes.askMoneyRoute : (context) => AskMoneyPage(),
         MyRoutes.changePasswordRoute : (context) => ChangePasswordPage(),
         MyRoutes.inviteRoute : (context) => InvitePage(),
         MyRoutes.forgotpasswordRoute : (context) => ForgotPassword(),
         MyRoutes.ChangepasswordTheme2Route : (context) => ChangePasswordPage_theme2(),
         MyRoutes.ChangepasswordTheme3Route : (context) => ChangePasswordPage_theme3(),
         MyRoutes.selectContactTheme2Route : (context) => SelectContactstheme2(),
         MyRoutes.selectContactsTheme3Route : (context) => SelectContactstheme3(),
         MyRoutes.sendNotificationsTheme2Route : (context) => NotificationScreentheme_2(),
         MyRoutes.sendNotificationsTheme3Route : (context) => NotificationScreentheme_3(),
         MyRoutes.settingsTheme2Route : (context) => SettingsPageUItheme2(),
         MyRoutes.settingsTheme3Route : (context) => SettingsPageUItheme3(),
         MyRoutes.homePageTheme2Route : (context) => HomeScreentheme2(),
         MyRoutes.homePageTheme3Route : (context) => HomeScreentheme3(),
         MyRoutes.selectThemeRoute : (context) => theme_1(),
         MyRoutes.selectTheme2Route : (context) => theme_2(),
         MyRoutes.selectTheme3Route : (context) => theme_3(),
         MyRoutes.transactionRoute : (context) =>   DailyPage(),
         MyRoutes.createBudgetRoute : (context) => CreatBudgetPage(),
         MyRoutes.budgetPlannerRoute : (context) => BudgetPage(),
         MyRoutes.currencyConvertRoute : (context) => CurrencyExchange(),
         MyRoutes.moneylockRoute : (context) => moneyLock(),
         MyRoutes.editMoneyLockingRoute : (context) => EditMoneyScreen(),
         MyRoutes.gameLevelRoute : (context) => GameLevelScreen(),
         MyRoutes.gameRoute : (context) => GameScreen(),
         MyRoutes.CurvedNavBarWhiteRoute : (context) => WhiteBottomNavigationBar(),
         MyRoutes.GameCurvedNavBarWhiteRoute : (context) => GameBottomNavigationBar(),
         MyRoutes.LockCurvedNavBarWhiteRoute : (context) => MoneyBottomNavigationBar(),
         MyRoutes.Theme2CurvedNavBarWhiteRoute : (context) => Theme2BottomNavigationBar(),
         MyRoutes.Theme3CurvedNavBarWhiteRoute : (context) => Theme3BottomNavigationBar(),
         MyRoutes.payListUsersRoute : (context) => ListScreen(),
         MyRoutes.PayWithWalletRoute : (context) => PayScreen(),
      },
    );
  }
}

