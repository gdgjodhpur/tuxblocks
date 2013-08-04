package tuxkids.tuxblocks.core.solve;

import java.util.ArrayList;
import java.util.List;

import playn.core.GroupLayer;
import playn.core.ImageLayer;
import playn.core.Font.Style;
import playn.core.Pointer.Event;
import playn.core.TextFormat;
import playn.core.util.Clock;
import tripleplay.ui.layout.AxisLayout.Horizontal;
import tripleplay.util.Colors;
import tuxkids.tuxblocks.core.Button;
import tuxkids.tuxblocks.core.Button.OnReleasedListener;
import tuxkids.tuxblocks.core.Constant;
import tuxkids.tuxblocks.core.layers.LayerWrapper;
import tuxkids.tuxblocks.core.solve.blocks.BaseBlock;
import tuxkids.tuxblocks.core.solve.blocks.Block;
import tuxkids.tuxblocks.core.solve.blocks.BlockController;
import tuxkids.tuxblocks.core.solve.blocks.HorizontalModifierBlock;
import tuxkids.tuxblocks.core.solve.blocks.MinusBlock;
import tuxkids.tuxblocks.core.solve.blocks.ModifierBlock;
import tuxkids.tuxblocks.core.solve.blocks.OverBlock;
import tuxkids.tuxblocks.core.solve.blocks.PlusBlock;
import tuxkids.tuxblocks.core.solve.blocks.BlockController.BuildToolbox;
import tuxkids.tuxblocks.core.solve.blocks.NumberBlock;
import tuxkids.tuxblocks.core.solve.blocks.TimesBlock;
import tuxkids.tuxblocks.core.solve.blocks.VariableBlock;
import tuxkids.tuxblocks.core.utils.CanvasUtils;

public class Toolbox extends LayerWrapper implements BuildToolbox {

	protected GroupLayer layer;
	protected ImageLayer backgroundLayer, numberLayer;
	protected float width, height;
	protected BlockController controller;
	protected List<Block> blocks = new ArrayList<Block>();
	protected Button buttonNumber, buttonLess, buttonMore;
	protected int number = 1;
	protected TextFormat textFormat;
	protected NumberSelectListener listener;
	
	public int number() {
		return number;
	}
	
	public Toolbox(BlockController controller, NumberSelectListener numberSelectListener, float width, float height) {
		super(graphics().createGroupLayer());
		this.layer = (GroupLayer) layerAddable();
		this.width = width;
		this.height = height;
		this.controller = controller;
		this.listener = numberSelectListener;
		controller.setBuildToolbox(this);
		
		backgroundLayer = graphics().createImageLayer();
		backgroundLayer.setImage(CanvasUtils.createRect(width, height, Colors.LIGHT_GRAY, 1, Colors.DARK_GRAY));
		backgroundLayer.setAlpha(0.75f);
		layer.add(backgroundLayer);

		float blockStart = 2 * width / 3;
		float circleSize = width * 0.6f;
		buttonNumber = new Button(Constant.BUTTON_CIRCLE, circleSize, circleSize, true);
		buttonNumber.setPosition(width / 2, circleSize * 0.6f);
		buttonNumber.setOnReleasedListener(new OnReleasedListener() {
			@Override
			public void onRelease(Event event, boolean inButton) {
				if (inButton) listener.selectNumber(number);
			}
		});
		layer.add(buttonNumber.layerAddable());
		
		float arrowX = width / 10;
		buttonLess = new Button(Constant.BUTTON_LESS, width / 6, width / 3, false);
		buttonLess.setPosition(arrowX, buttonNumber.y());
		buttonLess.setOnReleasedListener(new OnReleasedListener() {
			@Override
			public void onRelease(Event event, boolean inButton) {
				if (inButton) {
					setNumber(number - 1);
				}
			}
		});
		layer.add(buttonLess.layerAddable());
		
		buttonMore = new Button(Constant.BUTTON_MORE, width / 6, width / 3, false);
		buttonMore.setPosition(width - arrowX, buttonNumber.y());
		buttonMore.setOnReleasedListener(new OnReleasedListener() {
			@Override
			public void onRelease(Event event, boolean inButton) {
				if (inButton) {
					setNumber(number + 1);
				}
			}
		});
		layer.add(buttonMore.layerAddable());
		
		textFormat = new TextFormat().withFont(graphics().createFont(
				Constant.FONT_NAME, Style.PLAIN, buttonNumber.height() / 3));
		numberLayer = graphics().createImageLayer();
		numberLayer.setTranslation(buttonNumber.x(), buttonNumber.y());
		layer.add(numberLayer);
		refreshNumberSprite();
		
		VariableBlock variableBlock = new VariableBlock("x");
		blocks.add(variableBlock);
		
		NumberBlock numberBlock = new NumberBlock(number);
		blocks.add(numberBlock);
		
		PlusBlock plusBlock = new PlusBlock(number);
		blocks.add(plusBlock);
		
		MinusBlock minusBlock = new MinusBlock(number);
		blocks.add(minusBlock);
		
		TimesBlock timesBlock = new TimesBlock(number);
		blocks.add(timesBlock);
		
		OverBlock overBlock = new OverBlock(number);
		blocks.add(overBlock);
		
		for (Block block : blocks) {
			block.initSprite();
			block.addBlockListener(controller.blockListener());
			block.interpolateDefaultRect(null);
			layer.add(block.layer());
		}

		float blockSeg = (height - blockStart) / 4;
		variableBlock.layer().setTranslation((width - variableBlock.width()) / 2, blockStart + blockSeg * 0.5f - variableBlock.height() / 2);
		numberBlock.layer().setTranslation((width - numberBlock.width()) / 2, blockStart + blockSeg * 1.5f - numberBlock.height() / 2);
		plusBlock.layer().setTranslation(width / 2 - plusBlock.width() * 5 / 4, blockStart + blockSeg * 2.5f - plusBlock.height() / 2);
		minusBlock.layer().setTranslation(width / 2 + minusBlock.width() / 4, blockStart + blockSeg * 2.5f - minusBlock.height() / 2);
		timesBlock.layer().setTranslation((width - timesBlock.width()) / 2 , blockStart + blockSeg * 3.5f - timesBlock.height() * 5 / 4);
		overBlock.layer().setTranslation((width - overBlock.width()) / 2 , blockStart + blockSeg * 3.5f + overBlock.height() / 4);
	}
	
	public void setNumber(int number) {
		if (number == this.number) return;
		this.number = number;
		for (Block block : blocks) {
			if (block instanceof NumberBlock) {
				((NumberBlock) block).setValue(number);
			} else if (block instanceof ModifierBlock) {
				if (block instanceof HorizontalModifierBlock) {
					((ModifierBlock) block).setValue(Math.abs(number));	
				} else {
					((ModifierBlock) block).setValue(number);
				}
				block.layer().setVisible(number != 0);
			}
		}
		refreshNumberSprite();
	}
	
	private void refreshNumberSprite() {
		numberLayer.setImage(CanvasUtils.createString(textFormat, "" + number, Colors.BLACK));
		centerImageLayer(numberLayer);
	}

	public void update(int delta) {
		for (Block block : blocks) {
			block.update(delta);
		}
	}
	
	public void paint(Clock clock) {
		for (Block block : blocks) {
			block.paint(clock);
		}
	}

	@Override
	public void wasGrabbed(Event event) {
		wasMoved(event);
	}

	@Override
	public void wasMoved(Event event) {
		if (inRect(event)) {
			layer.setAlpha(1);
		} else {
			layer.setAlpha(BaseBlock.PREVIEW_ALPHA);
		}
	}

	@Override
	public boolean wasDropped(Event event) {
		layer.setAlpha(1);
		return inRect(event);
	}

	private boolean inRect(Event event) {
		float x = event.x(), y = event.y();
		return x >= layer.tx() && x < layer.tx() + width && 
				y >= layer.ty() && y < layer.ty() + height;
	}
	
	interface NumberSelectListener {
		void selectNumber(int startNumber);
	}
}