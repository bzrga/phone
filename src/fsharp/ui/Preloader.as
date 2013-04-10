package fsharp.ui
{
	import com.greensock.TweenMax;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	
	public class Preloader extends MovieClip
	{
		public var circle_mc:MovieClip;
		public var progress_txt:TextField;
		public var progress:Number;
		
		public function Preloader()
		{
			super();
		}
		
		public function init() {
			//this.addEventListener(Event.ENTER_FRAME, onSpin);
			alpha = 1;
			circle_mc.alpha = .3;
			TweenMax.to(circle_mc, .6, {alpha:1, yoyo:true, repeat:-1});	
		}
		
		private function onSpin(e:Event):void {
			circle_mc.rotation += 5;
		}
		
		public function updateProgress($progress:Number):void {
			progress = $progress;
			
			progress_txt.text = $progress + "%";
			if (progress > 99) {
				TweenMax.to(this, .3, {alpha:0, onComplete:function() {
					TweenMax.killTweensOf(circle_mc);
					this.visible = false;
				}});	
			}
		}
	}
}