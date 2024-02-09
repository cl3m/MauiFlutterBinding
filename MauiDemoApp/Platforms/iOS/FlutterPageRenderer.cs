using System;
using Foundation;
using Microsoft.Maui.Controls.Handlers.Compatibility;
using UIKit;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Runtime.Versioning;
using Microsoft.Maui.Controls.Internals;
using Microsoft.Maui.Controls.Platform;
using Microsoft.Maui.Graphics;
using ObjCRuntime;
using UIKit;
using PointF = CoreGraphics.CGPoint;
using RectangleF = CoreGraphics.CGRect;
using SizeF = CoreGraphics.CGSize;
using Microsoft.Maui.Controls.Compatibility.Platform.iOS;
using UIKit;
using iOS.Binding;
using Microsoft.Maui.Controls.PlatformConfiguration;

namespace MauiDemoApp
{
    public class FlutterPageRenderer : UIViewController, IVisualElementRenderer
    {
        private readonly UIViewController _controller;

        public FlutterPageRenderer()
        {
            _controller = (new iOS.Binding.Binding()).FlutterViewController;
        }

        public VisualElement Element { get; private set; }

        public event EventHandler<VisualElementChangedEventArgs> ElementChanged;

        public UIView NativeView
        {
            get { return _controller.View; }
        }

        public SizeRequest GetDesiredSize(double widthConstraint, double heightConstraint)
        {
            return NativeView.GetSizeRequest(widthConstraint, heightConstraint);
        }

        public void SetElement(VisualElement element)
        {
            Element = element;
        }

        public void SetElementSize(Size size)
        {
            Element.Layout(new Rect(Element.X, Element.Y, size.Width, size.Height));
        }

        public UIViewController ViewController
        {
            get { return _controller; }
        }
    }
}