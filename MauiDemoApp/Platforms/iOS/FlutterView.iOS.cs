namespace MauiDemoApp;

public class FlutterView : ContentView
{
	public FlutterView()
	{
		Content = new VerticalStackLayout
		{
			Children = {
				new Label { HorizontalOptions = LayoutOptions.Center, VerticalOptions = LayoutOptions.Center, Text = "FlutterView iOS"
                }
			}
		};
	}
}
