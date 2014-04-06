package tuxkids.tuxblocks.core.student;

import tuxkids.tuxblocks.core.GameState.Stat;
import tuxkids.tuxblocks.core.solve.action.FinishSimplifyAction;
import tuxkids.tuxblocks.core.solve.action.ReciprocalAction;
import tuxkids.tuxblocks.core.solve.action.StartSimplifyingBlocksAction;
import tuxkids.tuxblocks.core.solve.action.callbacks.SolveActionCallback;
import tuxkids.tuxblocks.core.solve.blocks.Block;
import tuxkids.tuxblocks.core.solve.blocks.Equation;
import tuxkids.tuxblocks.core.solve.blocks.ModifierBlock;
import tuxkids.tuxblocks.core.solve.blocks.ModifierGroup;
import tuxkids.tuxblocks.core.solve.markup.Renderer;
import tuxkids.tuxblocks.core.utils.persist.Persistable;

public interface StudentModel extends Persistable, SolveActionCallback {
	
	public static final double L0_HIGH =.7;
	public static final double L0_MED  =.4;
	public static final double L0_LOW =.1;
	
	public static final double BASE_SLIP = .1;
	
	public static final double BASE_GUESS =.1;

	public static final double TRANSITION_HIGH =.3;
	public static final double TRANSITION_MED  =.1;
	public static final double TRANSITION_LOW =.05;

	boolean isReadyForNextStarred();

	Equation getNextStarredEquation();

	Equation getNextGeneralEquation();

	void addFinishSimplifyTags(FinishSimplifyAction action, Block sprite,
			ModifierBlock pair, ModifierGroup modifiers);

	void addStartSimplifyTags(StartSimplifyingBlocksAction action,
			Renderer problem, int answer, Stat stat, int level);

	void addReciprocalActionTags(ReciprocalAction action, Block block);
	
}