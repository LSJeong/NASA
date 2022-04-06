package co.Nasa.prj.chatting.service;

import java.util.List;

import co.Nasa.prj.comm.VO.ServiceVO;

public interface ChatService {
	/*
	 * 채팅방 삭제 메소드
	 */
	public int chatroomDelete(String roomid);

	/**
	 * 방 번호를 선택하는 메소드
	 * 
	 * @param roomId
	 * @return
	 */
	public ChatRoom selectChatRoom(String roomid);

	/**
	 * 채팅 메세지 DB 저장
	 * 
	 * @param chatMessage
	 * @return
	 */
	public int insertMessage(ChatMessage chatMessage);

	/**
	 * 메세지 내용 리스트 출력
	 * 
	 * @param roomId
	 * @return
	 */
	public List<ChatMessage> messageList(String roomid);

	/**
	 * 채팅 방 DB 저장
	 * 
	 * @param room
	 * @return
	 */
	public int createChat(ChatRoom room);

	/**
	 * DB에 채팅 방이 있는지 확인
	 * 
	 * @param room
	 * @return
	 */
	public ChatRoom searchChatRoom(ChatRoom room);

	/**
	 * 채팅 방 리스트 출력
	 * 
	 * @param userEmail
	 * @return
	 */
	public List<ChatRoom> chatRoomList(String nickname);

	/**
	 * 채팅 읽지 않은 메세지 수 출력
	 * 
	 * @param message
	 * @return
	 */
	public int selectUnReadCount(ChatMessage message);

	/**
	 * 읽은 메세지 숫자 0으로 바꾸기
	 * 
	 * @param message
	 * @return
	 */
	public int updateCount(ChatMessage message);

	// 채팅에서 서비스 상세정보 상세정복확인

	public ServiceVO getRow(String ser_code);
	
	//채팅에서 프로모션 여부
	
	public String chatpromotion(String promotioncheck);

}
