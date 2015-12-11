#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wtypedef-redefinition"
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
#define DEBUG 1
#include <stdarg.h>
#include <xamarin/xamarin.h>
#include <objc/objc.h>
#include <objc/runtime.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreTelephony/CoreTelephonyDefines.h>
#import <CoreTelephony/CTCall.h>
#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTSubscriber.h>
#import <CoreTelephony/CTSubscriberInfo.h>


static void native_to_managed_trampoline_1 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, const char *r0, const char *r1, const char *r2)
{
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self);
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr));
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method);
	NSObject *nsobj0 = (NSObject *) p0;
	MonoObject *mobj0 = NULL;
	bool created0 = false;
	if (nsobj0) {
		MonoType *paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	return;
}


static BOOL native_to_managed_trampoline_2 (id self, SEL _cmd, MonoMethod **managed_method_ptr, void * p0, const char *r0, const char *r1, const char *r2)
{
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self);
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr));
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method);
	void * a0 = p0;
	arg_ptrs [0] = &a0;

	MonoObject * retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	BOOL res;
	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

	return res;
}


static void native_to_managed_trampoline_3 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self);
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL));
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method);
	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	return;
}


static id native_to_managed_trampoline_4 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self);
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL));
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method);
	MonoObject * retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	id res;
	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

	return res;
}


static BOOL native_to_managed_trampoline_5 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self);
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr));
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method);
	NSObject *nsobj0 = (NSObject *) p0;
	MonoObject *mobj0 = NULL;
	bool created0 = false;
	if (nsobj0) {
		MonoType *paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
	MonoObject *mobj1 = NULL;
	bool created1 = false;
	if (nsobj1) {
		MonoType *paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;

	MonoObject * retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	BOOL res;
	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

	return res;
}


static BOOL native_to_managed_trampoline_6 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, NSString * p2, id p3, const char *r0, const char *r1, const char *r2, const char *r3, const char *r4, const char *r5)
{
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self);
	}
	if (!managed_method) {
		const char *paramptr[4] = { r0, r1, r2, r3 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r4, r5, 4, paramptr));
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method);
	NSObject *nsobj0 = (NSObject *) p0;
	MonoObject *mobj0 = NULL;
	bool created0 = false;
	if (nsobj0) {
		MonoType *paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
	MonoObject *mobj1 = NULL;
	bool created1 = false;
	if (nsobj1) {
		MonoType *paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = p2 ? mono_string_new (mono_domain_get (), [p2 UTF8String]) : NULL;
	NSObject *nsobj3 = (NSObject *) p3;
	MonoObject *mobj3 = NULL;
	bool created3 = false;
	if (nsobj3) {
		MonoType *paramtype3 = xamarin_get_parameter_type (managed_method, 3);
		mobj3 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj3, false, paramtype3, &created3);
		xamarin_verify_parameter (mobj3, _cmd, self, nsobj3, 3, mono_class_from_mono_type (paramtype3), managed_method);
	}
	arg_ptrs [3] = mobj3;

	MonoObject * retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	BOOL res;
	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

	return res;
}


static id native_to_managed_trampoline_7 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (xamarin_try_get_nsobject (self))
		return self;
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL));
		*managed_method_ptr = managed_method;
	}
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (managed_method));
	uint8_t flags = 2;
	xamarin_set_nsobject_handle (mthis, self);
	xamarin_set_nsobject_flags (mthis, flags);
	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);
	xamarin_create_managed_ref (self, mthis, true);

	return self;
}


static void native_to_managed_trampoline_8 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, const char *r0, const char *r1, const char *r2)
{
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr));
		*managed_method_ptr = managed_method;
	}
	NSObject *nsobj0 = (NSObject *) p0;
	MonoObject *mobj0 = NULL;
	bool created0 = false;
	if (nsobj0) {
		MonoType *paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, NULL, arg_ptrs, NULL);

	return;
}


static void native_to_managed_trampoline_9 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, void * p3, const char *r0, const char *r1, const char *r2, const char *r3, const char *r4, const char *r5)
{
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self);
	}
	if (!managed_method) {
		const char *paramptr[4] = { r0, r1, r2, r3 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r4, r5, 4, paramptr));
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method);
	NSObject *nsobj0 = (NSObject *) p0;
	MonoObject *mobj0 = NULL;
	bool created0 = false;
	if (nsobj0) {
		MonoType *paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
	MonoObject *mobj1 = NULL;
	bool created1 = false;
	if (nsobj1) {
		MonoType *paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;
	NSObject *nsobj2 = (NSObject *) p2;
	MonoObject *mobj2 = NULL;
	bool created2 = false;
	if (nsobj2) {
		MonoType *paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, mono_class_from_mono_type (paramtype2), managed_method);
	}
	arg_ptrs [2] = mobj2;
	void * a3 = p3;
	arg_ptrs [3] = &a3;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	return;
}



@interface Foundation_InternalNSNotificationHandler : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) post:(id)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation Foundation_InternalNSNotificationHandler { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) post:(id)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_1 (self, _cmd, &managed_method, p0, "Foundation.NSNotification, Xamarin.iOS", "Foundation.InternalNSNotificationHandler, Xamarin.iOS", "Post");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface __MonoMac_NSActionDispatcher : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) xamarinApplySelector;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation __MonoMac_NSActionDispatcher { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "Foundation.NSActionDispatcher, Xamarin.iOS", "Apply");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface __MonoMac_NSAsyncActionDispatcher : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) xamarinApplySelector;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation __MonoMac_NSAsyncActionDispatcher { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "Foundation.NSAsyncActionDispatcher, Xamarin.iOS", "Apply");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface AppDelegate : NSObject<UIApplicationDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(id) window;
	-(void) setWindow:(id)p0;
	-(BOOL) application:(id)p0 didFinishLaunchingWithOptions:(id)p1;
	-(void) applicationWillResignActive:(id)p0;
	-(void) applicationDidEnterBackground:(id)p0;
	-(void) applicationWillEnterForeground:(id)p0;
	-(void) applicationDidBecomeActive:(id)p0;
	-(void) applicationWillTerminate:(id)p0;
	-(BOOL) application:(id)p0 openURL:(id)p1 sourceApplication:(NSString *)p2 annotation:(id)p3;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation AppDelegate { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(id) window
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_4 (self, _cmd, &managed_method, "IOSparking.AppDelegate, IOSparking", "get_Window");
	}

	-(void) setWindow:(id)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_1 (self, _cmd, &managed_method, p0, "UIKit.UIWindow, Xamarin.iOS", "IOSparking.AppDelegate, IOSparking", "set_Window");
	}

	-(BOOL) application:(id)p0 didFinishLaunchingWithOptions:(id)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_5 (self, _cmd, &managed_method, p0, p1, "UIKit.UIApplication, Xamarin.iOS", "Foundation.NSDictionary, Xamarin.iOS", "IOSparking.AppDelegate, IOSparking", "FinishedLaunching");
	}

	-(void) applicationWillResignActive:(id)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_1 (self, _cmd, &managed_method, p0, "UIKit.UIApplication, Xamarin.iOS", "IOSparking.AppDelegate, IOSparking", "OnResignActivation");
	}

	-(void) applicationDidEnterBackground:(id)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_1 (self, _cmd, &managed_method, p0, "UIKit.UIApplication, Xamarin.iOS", "IOSparking.AppDelegate, IOSparking", "DidEnterBackground");
	}

	-(void) applicationWillEnterForeground:(id)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_1 (self, _cmd, &managed_method, p0, "UIKit.UIApplication, Xamarin.iOS", "IOSparking.AppDelegate, IOSparking", "WillEnterForeground");
	}

	-(void) applicationDidBecomeActive:(id)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_1 (self, _cmd, &managed_method, p0, "UIKit.UIApplication, Xamarin.iOS", "IOSparking.AppDelegate, IOSparking", "OnActivated");
	}

	-(void) applicationWillTerminate:(id)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_1 (self, _cmd, &managed_method, p0, "UIKit.UIApplication, Xamarin.iOS", "IOSparking.AppDelegate, IOSparking", "WillTerminate");
	}

	-(BOOL) application:(id)p0 openURL:(id)p1 sourceApplication:(NSString *)p2 annotation:(id)p3
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, p2, p3, "UIKit.UIApplication, Xamarin.iOS", "Foundation.NSUrl, Xamarin.iOS", "System.String, mscorlib", "Foundation.NSObject, Xamarin.iOS", "IOSparking.AppDelegate, IOSparking", "OpenUrl");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_7 (self, _cmd, &managed_method, "IOSparking.AppDelegate, IOSparking", ".ctor");
	}
@end

@interface ViewController : UIViewController {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) viewDidLoad;
	-(void) didReceiveMemoryWarning;
	-(void) UIButton3_TouchUpInside:(id)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation ViewController { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "IOSparking.ViewController, IOSparking", "ViewDidLoad");
	}

	-(void) didReceiveMemoryWarning
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "IOSparking.ViewController, IOSparking", "DidReceiveMemoryWarning");
	}

	-(void) UIButton3_TouchUpInside:(id)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_1 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "IOSparking.ViewController, IOSparking", "UIButton3_TouchUpInside");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface __NSObject_Disposer : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	+(void) drain:(id)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation __NSObject_Disposer { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	+(void) drain:(id)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, "Foundation.NSObject, Xamarin.iOS", "Foundation.NSObject+NSObject_Disposer, Xamarin.iOS", "Drain");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_7 (self, _cmd, &managed_method, "Foundation.NSObject+NSObject_Disposer, Xamarin.iOS", ".ctor");
	}
@end

@interface __XamarinObjectObserver : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) observeValueForKeyPath:(id)p0 ofObject:(id)p1 change:(id)p2 context:(void *)p3;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation __XamarinObjectObserver { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) observeValueForKeyPath:(id)p0 ofObject:(id)p1 change:(id)p2 context:(void *)p3
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_9 (self, _cmd, &managed_method, p0, p1, p2, p3, "Foundation.NSString, Xamarin.iOS", "Foundation.NSObject, Xamarin.iOS", "Foundation.NSDictionary, Xamarin.iOS", "System.IntPtr, mscorlib", "Foundation.NSObject+Observer, Xamarin.iOS", "ObserveValue");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface PLCrashReporterConfig : NSObject {
}
	-(unsigned int) signalHandlerType;
	-(unsigned int) symbolicationStrategy;
	-(id) init;
	-(id) initWithSignalHandlerType:(unsigned int)p0 symbolicationStrategy:(unsigned int)p1;
@end

@interface PLCrashReporter : NSObject {
}
	-(BOOL) enableCrashReporterAndReturnError:(id*)p0;
	-(id) generateLiveReportAndReturnError:(id*)p0;
	-(id) generateLiveReportWithThread:(void *)p0;
	-(id) generateLiveReportWithThread:(void *)p0 error:(id*)p1;
	-(id) loadPendingCrashReportDataAndReturnError:(id*)p0;
	-(BOOL) purgePendingCrashReportAndReturnError:(id*)p0;
	-(void) setCrashCallbacks:(void *)p0;
	-(BOOL) enableCrashReporter;
	-(id) generateLiveReport;
	-(BOOL) hasPendingCrashReport;
	-(id) loadPendingCrashReportData;
	-(BOOL) purgePendingCrashReport;
	-(id) init;
	-(id) initWithConfiguration:(id)p0;
@end

@interface PLCrashReportApplicationInfo : NSObject {
}
	-(NSString *) applicationIdentifier;
	-(NSString *) applicationVersion;
	-(id) init;
	-(id) initWithApplicationIdentifier:(NSString *)p0 applicationVersion:(NSString *)p1;
@end

@interface PLCrashReportProcessorInfo : NSObject {
}
	-(unsigned long long) subtype;
	-(unsigned long long) type;
	-(unsigned int) typeEncoding;
	-(id) init;
	-(id) initWithTypeEncoding:(unsigned int)p0 type:(unsigned long long)p1 subtype:(unsigned long long)p2;
@end

@interface PLCrashReportBinaryImageInfo : NSObject {
}
	-(id) codeType;
	-(BOOL) hasImageUUID;
	-(unsigned long long) imageBaseAddress;
	-(NSString *) imageName;
	-(unsigned long long) imageSize;
	-(NSString *) imageUUID;
	-(id) init;
	-(id) initWithCodeType:(id)p0 baseAddress:(unsigned long long)p1 size:(unsigned long long)p2 name:(NSString *)p3 uuid:(id)p4;
@end

@interface PLCrashReportSymbolInfo : NSObject {
}
	-(unsigned long long) endAddress;
	-(unsigned long long) startAddress;
	-(NSString *) symbolName;
	-(id) init;
	-(id) initWithSymbolName:(NSString *)p0 startAddress:(unsigned long long)p1 endAddress:(unsigned long long)p2;
@end

@interface PLCrashReportStackFrameInfo : NSObject {
}
	-(unsigned long long) instructionPointer;
	-(id) symbolInfo;
	-(id) init;
	-(id) initWithInstructionPointer:(unsigned long long)p0 symbolInfo:(id)p1;
@end

@interface PLCrashReportRegisterInfo : NSObject {
}
	-(NSString *) registerName;
	-(unsigned long long) registerValue;
	-(id) init;
	-(id) initWithRegisterName:(NSString *)p0 registerValue:(unsigned long long)p1;
@end

@interface PLCrashReportThreadInfo : NSObject {
}
	-(BOOL) crashed;
	-(NSArray *) registers;
	-(NSArray *) stackFrames;
	-(int) threadNumber;
	-(id) init;
	-(id) initWithThreadNumber:(int)p0 stackFrames:(NSArray *)p1 crashed:(BOOL)p2 registers:(NSArray *)p3;
@end

@interface PLCrashReportExceptionInfo : NSObject {
}
	-(NSString *) exceptionName;
	-(NSString *) exceptionReason;
	-(NSArray *) stackFrames;
	-(id) init;
	-(id) initWithExceptionName:(NSString *)p0 reason:(NSString *)p1;
	-(id) initWithExceptionName:(NSString *)p0 reason:(NSString *)p1 stackFrames:(NSArray *)p2;
@end

@interface PLCrashReportMachineInfo : NSObject {
}
	-(unsigned int) logicalProcessorCount;
	-(NSString *) modelName;
	-(unsigned int) processorCount;
	-(id) processorInfo;
	-(id) init;
	-(id) initWithModelName:(NSString *)p0 processorInfo:(id)p1 processorCount:(unsigned int)p2 logicalProcessorCount:(unsigned int)p3;
@end

@interface PLCrashReportMachExceptionInfo : NSObject {
}
	-(NSArray *) codes;
	-(unsigned long long) type;
	-(id) init;
	-(id) initWithType:(unsigned long long)p0 codes:(NSArray *)p1;
@end

@interface PLCrashReportProcessInfo : NSObject {
}
	-(BOOL) native;
	-(unsigned int) parentProcessID;
	-(NSString *) parentProcessName;
	-(unsigned int) processID;
	-(NSString *) processName;
	-(NSString *) processPath;
	-(id) processStartTime;
	-(id) init;
	-(id) initWithProcessName:(NSString *)p0 processID:(unsigned int)p1 processPath:(NSString *)p2 processStartTime:(id)p3 parentProcessName:(NSString *)p4 parentProcessID:(unsigned int)p5 native:(BOOL)p6;
@end

@interface PLCrashReportSignalInfo : NSObject {
}
	-(unsigned long long) address;
	-(NSString *) code;
	-(NSString *) name;
	-(id) init;
	-(id) initWithSignalName:(NSString *)p0 code:(NSString *)p1 address:(unsigned long long)p2;
@end

@interface PLCrashReportSystemInfo : NSObject {
}
	-(unsigned int) architecture;
	-(unsigned int) operatingSystem;
	-(NSString *) operatingSystemBuild;
	-(NSString *) operatingSystemVersion;
	-(id) timestamp;
	-(id) init;
	-(id) initWithOperatingSystem:(unsigned int)p0 operatingSystemVersion:(NSString *)p1 architecture:(unsigned int)p2 timestamp:(id)p3;
	-(id) initWithOperatingSystem:(unsigned int)p0 operatingSystemVersion:(NSString *)p1 operatingSystemBuild:(NSString *)p2 architecture:(unsigned int)p3 timestamp:(id)p4;
@end

@interface PLCrashReport : NSObject {
}
	-(id) imageForAddress:(unsigned long long)p0;
	-(id) applicationInfo;
	-(id) exceptionInfo;
	-(BOOL) hasExceptionInfo;
	-(BOOL) hasMachineInfo;
	-(BOOL) hasProcessInfo;
	-(NSArray *) images;
	-(id) machExceptionInfo;
	-(id) machineInfo;
	-(id) processInfo;
	-(id) signalInfo;
	-(id) systemInfo;
	-(NSArray *) threads;
	-(NSString *) uuidRef;
	-(id) init;
	-(id) initWithData:(id)p0 error:(id*)p1;
@end

@interface PLCrashReportTextFormatter : NSObject {
}
	-(id) formatReport:(id)p0 error:(id*)p1;
	-(id) init;
	-(id) initWithTextFormat:(unsigned int)p0 stringEncoding:(NSUInteger)p1;
@end

	static MTClassMap __xamarin_class_map [] = {
		{"NSObject", "Foundation.NSObject, Xamarin.iOS", NULL },
		{"UIResponder", "UIKit.UIResponder, Xamarin.iOS", NULL },
		{"UIViewController", "UIKit.UIViewController, Xamarin.iOS", NULL },
		{"NSArray", "Foundation.NSArray, Xamarin.iOS", NULL },
		{"NSBundle", "Foundation.NSBundle, Xamarin.iOS", NULL },
		{"NSCoder", "Foundation.NSCoder, Xamarin.iOS", NULL },
		{"NSDate", "Foundation.NSDate, Xamarin.iOS", NULL },
		{"UIView", "UIKit.UIView, Xamarin.iOS", NULL },
		{"UIAlertView", "UIKit.UIAlertView, Xamarin.iOS", NULL },
		{"UIBarItem", "UIKit.UIBarItem, Xamarin.iOS", NULL },
		{"UIBezierPath", "UIKit.UIBezierPath, Xamarin.iOS", NULL },
		{"UIControl", "UIKit.UIControl, Xamarin.iOS", NULL },
		{"UIButton", "UIKit.UIButton, Xamarin.iOS", NULL },
		{"NSFileManager", "Foundation.NSFileManager, Xamarin.iOS", NULL },
		{"UIDevice", "UIKit.UIDevice, Xamarin.iOS", NULL },
		{"UINavigationController", "UIKit.UINavigationController, Xamarin.iOS", NULL },
		{"UIPageViewController", "UIKit.UIPageViewController, Xamarin.iOS", NULL },
		{"UIScreen", "UIKit.UIScreen, Xamarin.iOS", NULL },
		{"Foundation_InternalNSNotificationHandler", "Foundation.InternalNSNotificationHandler, Xamarin.iOS", NULL },
		{"NSValue", "Foundation.NSValue, Xamarin.iOS", NULL },
		{"NSNumber", "Foundation.NSNumber, Xamarin.iOS", NULL },
		{"NSRunLoop", "Foundation.NSRunLoop, Xamarin.iOS", NULL },
		{"NSString", "Foundation.NSString, Xamarin.iOS", NULL },
		{"NSURL", "Foundation.NSUrl, Xamarin.iOS", NULL },
		{"NSUUID", "Foundation.NSUuid, Xamarin.iOS", NULL },
		{"__MonoMac_NSActionDispatcher", "Foundation.NSActionDispatcher, Xamarin.iOS", NULL },
		{"__MonoMac_NSAsyncActionDispatcher", "Foundation.NSAsyncActionDispatcher, Xamarin.iOS", NULL },
		{"NSAutoreleasePool", "Foundation.NSAutoreleasePool, Xamarin.iOS", NULL },
		{"NSError", "Foundation.NSError, Xamarin.iOS", NULL },
		{"NSNull", "Foundation.NSNull, Xamarin.iOS", NULL },
		{"NSException", "Foundation.NSException, Xamarin.iOS", NULL },
		{"NSUserActivity", "Foundation.NSUserActivity, Xamarin.iOS", NULL },
		{"NSProcessInfo", "Foundation.NSProcessInfo, Xamarin.iOS", NULL },
		{"NSNotification", "Foundation.NSNotification, Xamarin.iOS", NULL },
		{"CTTelephonyNetworkInfo", "CoreTelephony.CTTelephonyNetworkInfo, Xamarin.iOS", NULL },
		{"CTCarrier", "CoreTelephony.CTCarrier, Xamarin.iOS", NULL },
		{"UIApplicationShortcutItem", "UIKit.UIApplicationShortcutItem, Xamarin.iOS", NULL },
		{"UILocalNotification", "UIKit.UILocalNotification, Xamarin.iOS", NULL },
		{"UIWindow", "UIKit.UIWindow, Xamarin.iOS", NULL },
		{"UITabBar", "UIKit.UITabBar, Xamarin.iOS", NULL },
		{"UITabBarController", "UIKit.UITabBarController, Xamarin.iOS", NULL },
		{"UITabBarItem", "UIKit.UITabBarItem, Xamarin.iOS", NULL },
		{"UISplitViewController", "UIKit.UISplitViewController, Xamarin.iOS", NULL },
		{"UIUserNotificationSettings", "UIKit.UIUserNotificationSettings, Xamarin.iOS", NULL },
		{"UIFocusAnimationCoordinator", "UIKit.UIFocusAnimationCoordinator, Xamarin.iOS", NULL },
		{"UIFocusUpdateContext", "UIKit.UIFocusUpdateContext, Xamarin.iOS", NULL },
		{"UITraitCollection", "UIKit.UITraitCollection, Xamarin.iOS", NULL },
		{"NSData", "Foundation.NSData, Xamarin.iOS", NULL },
		{"NSDictionary", "Foundation.NSDictionary, Xamarin.iOS", NULL },
		{"UIApplication", "UIKit.UIApplication, Xamarin.iOS", NULL },
		{"NSMutableDictionary", "Foundation.NSMutableDictionary, Xamarin.iOS", NULL },
		{"NSNotificationCenter", "Foundation.NSNotificationCenter, Xamarin.iOS", NULL },
		{"AppDelegate", "IOSparking.AppDelegate, IOSparking", NULL },
		{"ViewController", "IOSparking.ViewController, IOSparking", NULL },
		{"__NSObject_Disposer", "Foundation.NSObject+NSObject_Disposer, Xamarin.iOS", NULL },
		{"__XamarinObjectObserver", "Foundation.NSObject+Observer, Xamarin.iOS", NULL },
		{"PLCrashReporterConfig", "PLCrashReporter.PLCrashReporterConfig, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReporter", "PLCrashReporter.PLCrashReporter, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportApplicationInfo", "PLCrashReporter.PLCrashReportApplicationInfo, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportProcessorInfo", "PLCrashReporter.PLCrashReportProcessorInfo, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportBinaryImageInfo", "PLCrashReporter.PLCrashReportBinaryImageInfo, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportSymbolInfo", "PLCrashReporter.PLCrashReportSymbolInfo, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportStackFrameInfo", "PLCrashReporter.PLCrashReportStackFrameInfo, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportRegisterInfo", "PLCrashReporter.PLCrashReportRegisterInfo, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportThreadInfo", "PLCrashReporter.PLCrashReportThreadInfo, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportExceptionInfo", "PLCrashReporter.PLCrashReportExceptionInfo, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportMachineInfo", "PLCrashReporter.PLCrashReportMachineInfo, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportMachExceptionInfo", "PLCrashReporter.PLCrashReportMachExceptionInfo, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportProcessInfo", "PLCrashReporter.PLCrashReportProcessInfo, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportSignalInfo", "PLCrashReporter.PLCrashReportSignalInfo, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportSystemInfo", "PLCrashReporter.PLCrashReportSystemInfo, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReport", "PLCrashReporter.PLCrashReport, PLCrashReporterUnifiedBinding", NULL },
		{"PLCrashReportTextFormatter", "PLCrashReporter.PLCrashReportTextFormatter, PLCrashReporterUnifiedBinding", NULL },
		{ NULL, NULL, NULL },
	};

	static const char *__xamarin_registration_assemblies []= {
		"IOSparking", 
		"Xamarin.iOS", 
		"mscorlib", 
		"System", 
		"System.Xml", 
		"System.Core", 
		"Mono.Dynamic.Interpreter", 
		"clipclapcharge", 
		"Newtonsoft.Json", 
		"System.Runtime.Serialization", 
		"System.ServiceModel.Internals", 
		"RestSharp", 
		"System.Xml.Linq", 
		"Xamarin.Insights", 
		"PLCrashReporterUnifiedBinding", 
		"System.Net.Http"
	};

	static struct MTRegistrationMap __xamarin_registration_map = {
		NULL,
		__xamarin_registration_assemblies,
		__xamarin_class_map,
		16,
		73,
		21
	};

void xamarin_create_classes () {
	__xamarin_class_map [0].handle = objc_getClass ("NSObject");
	__xamarin_class_map [1].handle = objc_getClass ("UIResponder");
	__xamarin_class_map [2].handle = objc_getClass ("UIViewController");
	__xamarin_class_map [3].handle = objc_getClass ("NSArray");
	__xamarin_class_map [4].handle = objc_getClass ("NSBundle");
	__xamarin_class_map [5].handle = objc_getClass ("NSCoder");
	__xamarin_class_map [6].handle = objc_getClass ("NSDate");
	__xamarin_class_map [7].handle = objc_getClass ("UIView");
	__xamarin_class_map [8].handle = objc_getClass ("UIAlertView");
	__xamarin_class_map [9].handle = objc_getClass ("UIBarItem");
	__xamarin_class_map [10].handle = objc_getClass ("UIBezierPath");
	__xamarin_class_map [11].handle = objc_getClass ("UIControl");
	__xamarin_class_map [12].handle = objc_getClass ("UIButton");
	__xamarin_class_map [13].handle = objc_getClass ("NSFileManager");
	__xamarin_class_map [14].handle = objc_getClass ("UIDevice");
	__xamarin_class_map [15].handle = objc_getClass ("UINavigationController");
	__xamarin_class_map [16].handle = objc_getClass ("UIPageViewController");
	__xamarin_class_map [17].handle = objc_getClass ("UIScreen");
	__xamarin_class_map [18].handle = objc_getClass ("Foundation_InternalNSNotificationHandler");
	__xamarin_class_map [19].handle = objc_getClass ("NSValue");
	__xamarin_class_map [20].handle = objc_getClass ("NSNumber");
	__xamarin_class_map [21].handle = objc_getClass ("NSRunLoop");
	__xamarin_class_map [22].handle = objc_getClass ("NSString");
	__xamarin_class_map [23].handle = objc_getClass ("NSURL");
	__xamarin_class_map [24].handle = objc_getClass ("NSUUID");
	__xamarin_class_map [25].handle = objc_getClass ("__MonoMac_NSActionDispatcher");
	__xamarin_class_map [26].handle = objc_getClass ("__MonoMac_NSAsyncActionDispatcher");
	__xamarin_class_map [27].handle = objc_getClass ("NSAutoreleasePool");
	__xamarin_class_map [28].handle = objc_getClass ("NSError");
	__xamarin_class_map [29].handle = objc_getClass ("NSNull");
	__xamarin_class_map [30].handle = objc_getClass ("NSException");
	__xamarin_class_map [31].handle = objc_getClass ("NSUserActivity");
	__xamarin_class_map [32].handle = objc_getClass ("NSProcessInfo");
	__xamarin_class_map [33].handle = objc_getClass ("NSNotification");
	__xamarin_class_map [34].handle = objc_getClass ("CTTelephonyNetworkInfo");
	__xamarin_class_map [35].handle = objc_getClass ("CTCarrier");
	__xamarin_class_map [36].handle = objc_getClass ("UIApplicationShortcutItem");
	__xamarin_class_map [37].handle = objc_getClass ("UILocalNotification");
	__xamarin_class_map [38].handle = objc_getClass ("UIWindow");
	__xamarin_class_map [39].handle = objc_getClass ("UITabBar");
	__xamarin_class_map [40].handle = objc_getClass ("UITabBarController");
	__xamarin_class_map [41].handle = objc_getClass ("UITabBarItem");
	__xamarin_class_map [42].handle = objc_getClass ("UISplitViewController");
	__xamarin_class_map [43].handle = objc_getClass ("UIUserNotificationSettings");
	__xamarin_class_map [44].handle = objc_getClass ("UIFocusAnimationCoordinator");
	__xamarin_class_map [45].handle = objc_getClass ("UIFocusUpdateContext");
	__xamarin_class_map [46].handle = objc_getClass ("UITraitCollection");
	__xamarin_class_map [47].handle = objc_getClass ("NSData");
	__xamarin_class_map [48].handle = objc_getClass ("NSDictionary");
	__xamarin_class_map [49].handle = objc_getClass ("UIApplication");
	__xamarin_class_map [50].handle = objc_getClass ("NSMutableDictionary");
	__xamarin_class_map [51].handle = objc_getClass ("NSNotificationCenter");
	__xamarin_class_map [52].handle = [AppDelegate class];
	__xamarin_class_map [53].handle = [ViewController class];
	__xamarin_class_map [54].handle = objc_getClass ("__NSObject_Disposer");
	__xamarin_class_map [55].handle = objc_getClass ("__XamarinObjectObserver");
	__xamarin_class_map [56].handle = [PLCrashReporterConfig class];
	__xamarin_class_map [57].handle = [PLCrashReporter class];
	__xamarin_class_map [58].handle = [PLCrashReportApplicationInfo class];
	__xamarin_class_map [59].handle = [PLCrashReportProcessorInfo class];
	__xamarin_class_map [60].handle = [PLCrashReportBinaryImageInfo class];
	__xamarin_class_map [61].handle = [PLCrashReportSymbolInfo class];
	__xamarin_class_map [62].handle = [PLCrashReportStackFrameInfo class];
	__xamarin_class_map [63].handle = [PLCrashReportRegisterInfo class];
	__xamarin_class_map [64].handle = [PLCrashReportThreadInfo class];
	__xamarin_class_map [65].handle = [PLCrashReportExceptionInfo class];
	__xamarin_class_map [66].handle = [PLCrashReportMachineInfo class];
	__xamarin_class_map [67].handle = [PLCrashReportMachExceptionInfo class];
	__xamarin_class_map [68].handle = [PLCrashReportProcessInfo class];
	__xamarin_class_map [69].handle = [PLCrashReportSignalInfo class];
	__xamarin_class_map [70].handle = [PLCrashReportSystemInfo class];
	__xamarin_class_map [71].handle = [PLCrashReport class];
	__xamarin_class_map [72].handle = [PLCrashReportTextFormatter class];
	xamarin_add_registration_map (&__xamarin_registration_map);
}

