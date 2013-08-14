package tuxkids.tuxblocks.core;

import static playn.core.PlayN.currentTime;
import static playn.core.PlayN.graphics;

import javax.swing.GroupLayout.Alignment;

import playn.core.Canvas;
import playn.core.CanvasImage;
import playn.core.Color;
import playn.core.Font;
import playn.core.Game;
import playn.core.ImageLayer;
import playn.core.TextFormat;
import playn.core.Font.Style;
import playn.core.TextLayout;
import tripleplay.game.ScreenStack;
import tripleplay.util.Colors;
import tuxkids.tuxblocks.core.title.TitleScreen;
import tuxkids.tuxblocks.core.tutorial.Tutorial;

public class TuxBlocksGame extends Game.Default {

	public static final int UPDATE_RATE = 1000 / 30;
	private final static int MAX_DELTA = (int)(UPDATE_RATE * 1.5f);
	
	protected final SolidClock clock = new SolidClock(UPDATE_RATE);
	//protected final Clock.Source clock = new Clock.Source(UPDATE_RATE);

    protected final ScreenStack screens = new ScreenStack() {
//        @Override protected void handleError (RuntimeException error) {
//            log().warn("Screen failure", error);
//        }
        @Override public Transition defaultPushTransition () {
//        	return fade;
            return slide();
        }
        @Override public Transition defaultPopTransition () {
            //return new FadeTransition(screens); 
            return slide().right();
        }
    };
    
	private static TuxBlocksGame instance;
	
	private GameBackgroundSprite background;
	
	public static int screenDepth() {
		return instance.screens.size();
	}
	
	public TuxBlocksGame() {
		super(UPDATE_RATE);
		instance = this;
	}

	@Override
	public void init() {
		
		Cache.clear();
		Audio.clear();
		Tutorial.cancel();
		
		Constant.preloadImages();
		Constant.preloadAudio();
		
		Audio.bg().play(Constant.BG_MENU);
		Audio.bg().setVolume(0.7f);
		
		background = new GameBackgroundSprite();
		background.layer().setDepth(-10);
		
//		Button menuButton = new Button(Constant.BUTTON_MENU, 
//				MenuLayer.defaultButtonSize(), MenuLayer.defaultButtonSize(), true);
//		menuButton.setPosition(menuButton.width() * 0.15f, 
//				graphics().height() - menuButton.height() * 0.15f);
//		menuButton.setTint(Colors.WHITE, 0.3f);
//		menuButton.layerAddable().setDepth(10);
//		graphics().rootLayer().add(menuButton.layerAddable());
		
		
		graphics().rootLayer().add(background.layer());
		screens.push(new TitleScreen(screens, background));
//		screens.push(new DefenseScreen(screens, state));
//		screens.push(new BuildScreen(screens, state));
		
	}
	
	private int frames;
	private double lastUpdate;
	private ImageLayer fpsLayer;
	private void updateFPS() {
		frames++;
		if (lastUpdate < currentTime() - 1000) {
			lastUpdate = currentTime();
			CanvasImage image = graphics().createImage(40, 13);
			Canvas canvas = image.canvas();
			canvas.setFillColor(Color.rgb(50, 50, 50));
			canvas.drawText(frames + " FPS", 0, image.height());
			if (fpsLayer == null) {
				fpsLayer =  graphics().createImageLayer(image);
				fpsLayer.setDepth(Float.MAX_VALUE);
				graphics().rootLayer().add(fpsLayer);
			} else {
				fpsLayer.setImage(image);
			}
			frames = 0;
		}
	}

	@Override
	public void update(int delta) {
		delta = Math.min(delta, MAX_DELTA);
		clock.update(delta);
		background.update(delta);
        screens.update(delta);
        Tutorial.update(delta);
        Audio.update(delta);
	}

	@Override
	public void paint(float alpha) {
		clock.paint(alpha);
		background.paint(clock);
        screens.paint(clock);
        Tutorial.paint(clock);
		updateFPS();
	}
	
//	Font font = graphics().createFont("Arial", Style.PLAIN, 24);
//	TextFormat format = new TextFormat().withFont(font).withWrapWidth(95);
//	TextLayout layout = graphics().layoutText("Hello, it’s the world.", format);
//	
//	CanvasImage image = graphics().createImage(200, 200);
//	image.canvas().setFillColor(Colors.WHITE);
//	image.canvas().fillText(layout, 0, 0);
//	graphics().rootLayer().add(graphics().createImageLayer(image));
}
