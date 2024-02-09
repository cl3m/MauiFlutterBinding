using Foundation;
using UIKit;

namespace iOS.Binding
{
	// typedef void (^StringCallback)(NSString * _Nonnull);
	delegate void StringCallback (string arg0);

	// @interface Binding : NSObject
	[BaseType (typeof(NSObject))]
	interface Binding
	{
		// -(void)asyncWithParameters:(NSArray<NSString *> * _Nonnull)parameters callback:(StringCallback _Nonnull)callback;
		[Export ("asyncWithParameters:callback:")]
		void AsyncWithParameters (string[] parameters, StringCallback callback);

		// -(UIViewController * _Nonnull)getFlutterViewController __attribute__((warn_unused_result("")));
		[Export ("getFlutterViewController")]
		UIViewController FlutterViewController { get; }
	}
}
