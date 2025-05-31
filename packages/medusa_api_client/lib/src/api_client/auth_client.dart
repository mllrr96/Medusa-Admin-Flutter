library;

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;
import '../models/models.dart';
part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(
    Dio dio, {
    ParseErrorLogger? errorLogger,
    String? baseUrl,
  }) = _AuthClient;

  /// post
  /// {
  ///     "tags": [
  ///         "Auth"
  ///     ],
  ///     "summary": "Set Authentication Session",
  ///     "description": "Set the cookie session ID of an admin user. The admin must be previously authenticated with the `/auth/user/{provider}` API route first, as the JWT token is required in the header of the request.",
  ///     "operationId": "PostSession",
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AuthAdminSessionResponse"
  ///                     }
  ///                 }
  ///             }
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/auth/session")
  Future<HttpResponse<AuthAdminSessionResponse>> postSession({
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @Header("Authorization") String? authorization,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// delete
  /// {
  ///     "tags": [
  ///         "Auth"
  ///     ],
  ///     "summary": "Delete Authentication Session",
  ///     "description": "Deletes the cookie session ID previously set for authentication.",
  ///     "operationId": "DeleteSession",
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "type": "object",
  ///                         "description": "The deletion's details."
  ///                     }
  ///                 }
  ///             }
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @DELETE("/auth/session")
  Future<HttpResponse<Map<String, dynamic>>> deleteSession({
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Auth"
  ///     ],
  ///     "summary": "Refresh Authentication Token",
  ///     "description": "Refresh the authentication token of a user. This is useful after authenticating a user with a third-party service to ensure the token holds the new user's details, or when you don't want users to re-login every day.",
  ///     "operationId": "PostAdminAuthTokenRefresh",
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AuthResponse"
  ///                     }
  ///                 }
  ///             }
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/auth/token/refresh")
  Future<HttpResponse<AuthResponse>> postAdminAuthTokenRefresh({
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Auth"
  ///     ],
  ///     "summary": "Authenticate User",
  ///     "description": "Authenticate a user and receive the JWT token to be used in the header of subsequent requests.\n\nWhen used with a third-party provider, such as Google, the request returns a `location` property. You redirect to the specified URL in your frontend to continue authentication with the third-party service.\n",
  ///     "operationId": "PostActor_typeAuth_provider",
  ///     "parameters": [
  ///         {
  ///             "name": "auth_provider",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The provider used for authentication."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "type": "object",
  ///                     "description": "The input data necessary for authentication. \nFor example, for email-pass authentication, pass `email` and `password` properties. \nFor the Google and GitHub authentication providers, you can pass `callback_url` to indicate the URL in the frontend that the user should be redirected to after completing their authentication. This will override the provider's `callbackUrl` configurations in `medusa-config.ts`.\n",
  ///                     "title": "input"
  ///                 }
  ///             }
  ///         }
  ///     },
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "oneOf": [
  ///                             {
  ///                                 "$ref": "#/components/schemas/AuthResponse"
  ///                             },
  ///                             {
  ///                                 "$ref": "#/components/schemas/AuthCallbackResponse"
  ///                             }
  ///                         ]
  ///                     }
  ///                 }
  ///             }
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/auth/user/{auth_provider}")
  Future<HttpResponse<AuthResponseOrAuthCallbackResponseUnion>>
  postActorTypeAuthProvider({
    @Body() required Map<String, dynamic> requestBody,
    @Path("auth_provider") required String authProvider,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Auth"
  ///     ],
  ///     "summary": "Validate Authentication Callback",
  ///     "description": "This API route is used by your dashboard or frontend application when a third-party provider redirects to it after authentication. It validates the authentication with the third-party provider and, if successful, returns an authentication token. All query parameters received from the third-party provider, such as `code`, `state`, and `error`, must be passed as query parameters to this route.\n\nYou can decode the JWT token using libraries like [react-jwt](https://www.npmjs.com/package/react-jwt) in the frontend. If the decoded data doesn't  have an `actor_id` property, then you must create a user, typically using the Accept Invite route passing the token in the request's Authorization header.\n",
  ///     "operationId": "PostActor_typeAuth_providerCallback",
  ///     "parameters": [
  ///         {
  ///             "name": "auth_provider",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The provider used for authentication."
  ///         }
  ///     ],
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AuthResponse"
  ///                     }
  ///                 }
  ///             }
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/auth/user/{auth_provider}/callback")
  Future<HttpResponse<AuthResponse>> postActorTypeAuthProviderCallback({
    @Path("auth_provider") required String authProvider,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Auth"
  ///     ],
  ///     "summary": "Retrieve Registration JWT Token",
  ///     "description": "This API route retrieves a registration JWT token of a user that hasn't been registered yet. The token is used in the header of requests that create a user, such as the Accept Invite API route.",
  ///     "operationId": "PostActor_typeAuth_provider_register",
  ///     "parameters": [
  ///         {
  ///             "name": "auth_provider",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The provider used for authentication."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "type": "object",
  ///                     "description": "The input data necessary for authentication. For example, for email-pass authentication, pass `email` and `password` properties.",
  ///                     "title": "input"
  ///                 }
  ///             }
  ///         }
  ///     },
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "$ref": "#/components/schemas/AuthResponse"
  ///                     }
  ///                 }
  ///             }
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/auth/user/{auth_provider}/register")
  Future<HttpResponse<AuthResponse>> postActorTypeAuthProviderRegister({
    @Body() required Map<String, dynamic> requestBody,
    @Path("auth_provider") required String authProvider,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Auth"
  ///     ],
  ///     "summary": "Generate Reset Password Token for Admin User",
  ///     "description": "Generate a reset password token for an admin user. This API route doesn't reset the admin's password or send them the reset instructions in a notification.\n\nInstead, This API route emits the `auth.password_reset` event, passing it the token as a payload. You can listen to that event in a subscriber as explained in [this guide](https://docs.medusajs.com/resources/commerce-modules/auth/reset-password), then send the user a notification. The notification is sent using a [Notification Module Provider](https://docs.medusajs.com/resources/infrastructure-modules/notification), and it should have the URL to reset the password in the Medusa Admin dashboard, such as `http://localhost:9000/app/reset-password?token=123`.\n\n\n Use the generated token to update the user's password using the [Reset Password API route](https://docs.medusajs.com/api/admin#auth_postactor_typeauth_providerupdate).\n",
  ///     "operationId": "PostActor_typeAuth_providerResetPassword",
  ///     "parameters": [
  ///         {
  ///             "name": "auth_provider",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The provider used for authentication."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "type": "object",
  ///                     "description": "The user's identifier for the selected auth provider. For example, for the `emailpass` auth provider, the value is the user's email.",
  ///                     "title": "identifier"
  ///                 }
  ///             }
  ///         }
  ///     },
  ///     "responses": {
  ///         "201": {
  ///             "description": "OK"
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/auth/user/{auth_provider}/reset-password")
  Future<HttpResponse> postActorTypeAuthProviderResetPassword({
    @Body() required Map<String, dynamic> requestBody,
    @Path("auth_provider") required String authProvider,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  /// post
  /// {
  ///     "tags": [
  ///         "Auth"
  ///     ],
  ///     "summary": "Reset an Admin User's Password",
  ///     "description": "Reset an admin user's password using a reset-password token generated with the [Generate Reset Password Token API route](https://docs.medusajs.com/api/admin#auth_postactor_typeauth_providerresetpassword). You pass the token as a bearer token in the request's Authorization header.",
  ///     "operationId": "PostActor_typeAuth_providerUpdate",
  ///     "security": [
  ///         {
  ///             "reset_password": []
  ///         }
  ///     ],
  ///     "parameters": [
  ///         {
  ///             "name": "auth_provider",
  ///             "in": "path",
  ///             "required": true,
  ///             "schema": {
  ///                 "type": "string"
  ///             },
  ///             "description": "The provider used for authentication."
  ///         }
  ///     ],
  ///     "requestBody": {
  ///         "content": {
  ///             "application/json": {
  ///                 "schema": {
  ///                     "type": "object",
  ///                     "description": "The input data necessary for authentication. For example, for email-pass authentication, pass `email` and `password` properties.",
  ///                     "title": "input"
  ///                 }
  ///             }
  ///         }
  ///     },
  ///     "responses": {
  ///         "200": {
  ///             "description": "OK",
  ///             "content": {
  ///                 "application/json": {
  ///                     "schema": {
  ///                         "type": "object",
  ///                         "description": "Details on the reset password's status."
  ///                     }
  ///                 }
  ///             }
  ///         },
  ///         "400": {},
  ///         "401": {},
  ///         "404": {},
  ///         "409": {},
  ///         "422": {},
  ///         "500": {}
  ///     }
  /// }
  @POST("/auth/user/{auth_provider}/update")
  Future<HttpResponse<Map<String, dynamic>>> postActorTypeAuthProviderUpdate({
    @Body() required Map<String, dynamic> requestBody,
    @Path("auth_provider") required String authProvider,
    @Extras() Map<String, dynamic>? extras,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });
}
