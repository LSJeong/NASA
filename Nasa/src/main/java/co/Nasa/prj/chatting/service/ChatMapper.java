package co.Nasa.prj.chatting.service;

import java.util.List;

import co.Nasa.prj.comm.VO.ServiceVO;


public interface ChatMapper {
	
	public int createChat(ChatRoom room); // 채팅방 생성 
	
	public ChatRoom selectChatRoom(String roomid); // 채팅방 가져오기 
	
	public int insertMessage(ChatMessage chatMessage); // 상호간 메세지 데이터 값 넣기
	
	public ChatRoom searchChatRoom(ChatRoom searchRoom); // 채팅방의 메세지 정보 가져오기
	
	public List<ChatRoom> chatRoomList(String userId);  // 로그인한 유저의 채팅방 가져오기
	
	public int selectUnReadCount(ChatMessage message); // 메세지 서로 간 읽었는지 확인가능

	public int updateCount(ChatMessage message); // 읽지 않은 메세지 수
	
	public int chatroomDelete(String roomid);
	
	public List<ChatMessage> messageList(String roomid); //메세지 내용 리스트 출력
	
	//채팅에서 서비스 상세정보 상세정복확인
	public ServiceVO getRow(String ser_code);
	
	//채팅에서 프로모션 여부
	
	public String chatpromotion(String promotioncheck);

	
	
	
	
}
