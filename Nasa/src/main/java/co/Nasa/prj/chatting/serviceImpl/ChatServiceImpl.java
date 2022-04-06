package co.Nasa.prj.chatting.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import co.Nasa.prj.chatting.service.ChatMapper;
import co.Nasa.prj.chatting.service.ChatMessage;
import co.Nasa.prj.chatting.service.ChatRoom;
import co.Nasa.prj.chatting.service.ChatService;
import co.Nasa.prj.comm.VO.ServiceVO;

@Repository("cService")
public class ChatServiceImpl implements ChatService {
	@Autowired
	ChatMapper mapper;
	
	@Override
	public ChatRoom selectChatRoom(String roomid) {
		return mapper.selectChatRoom(roomid);
	}

	@Override
	public int insertMessage(ChatMessage chatMessage) {
		return mapper.insertMessage(chatMessage);
	}

	@Override
	public List<ChatMessage> messageList(String roomid) {
		return mapper.messageList(roomid);
	}

	@Override
	public int createChat(ChatRoom room) {
		return mapper.createChat(room);
	}

	@Override
	public ChatRoom searchChatRoom(ChatRoom room) {
		return mapper.searchChatRoom(room);
	}

	@Override
	public List<ChatRoom> chatRoomList(String userid) {
		return mapper.chatRoomList(userid);
	}

	@Override
	public int selectUnReadCount(ChatMessage message) {
		return mapper.selectUnReadCount(message);
	}

	@Override
	public int updateCount(ChatMessage message) {
		return mapper.updateCount(message);
	}

	@Override
	public int chatroomDelete(String roomid) {
		return mapper.chatroomDelete(roomid);
	}

	@Override
	public ServiceVO getRow(String ser_code) {
		// TODO Auto-generated method stub
		return mapper.getRow(ser_code);
	}

	@Override
	public String chatpromotion(String promotioncheck) {
		// TODO Auto-generated method stub
		return mapper.chatpromotion(promotioncheck);
	}

}
