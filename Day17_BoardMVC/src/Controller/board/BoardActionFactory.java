package Controller.board;

import Service.Action;
import Service.board.BoardListAction;
import Service.board.BoardWriteAction;

public class BoardActionFactory {
	private static BoardActionFactory instance = new BoardActionFactory();
	private BoardActionFactory() {} 
	public static BoardActionFactory getInstance() {
		return instance;
	}
	
	
	public Action getAction(String cmd) {
		Action action = null;
		System.out.println();
		if(cmd.equals("board_list")) {
			action = new BoardListAction();
		}else {
			action = new BoardWriteAction();
		}
		
		return action;
	}
	
	
}
