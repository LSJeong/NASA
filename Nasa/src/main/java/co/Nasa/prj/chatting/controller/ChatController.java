package co.Nasa.prj.chatting.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import co.Nasa.prj.buyer.service.BuyerService;
import co.Nasa.prj.chatting.service.ChatMessage;
import co.Nasa.prj.chatting.service.ChatRoom;
import co.Nasa.prj.chatting.serviceImpl.ChatServiceImpl;
import co.Nasa.prj.comm.VO.BuyerVO;
import co.Nasa.prj.comm.VO.SellerVO;
import co.Nasa.prj.comm.VO.ServiceVO;
import co.Nasa.prj.seller.service.SellerService;
import co.Nasa.prj.service.service.ServiceService;
 
 
@Controller
public class ChatController {
    @Autowired
    private ChatServiceImpl cService;
    
    @Autowired
    private BuyerService BuyerDao;
    @Autowired
    private SellerService sellerDAO;
//    @Autowired
//    private LoginService serviceDao;
//    
//    @Autowired
//    private ProductService pService;
    @Autowired
    private ServiceService serviceDao;
    
    @RequestMapping(value = "/chatting.do", method = RequestMethod.GET)
    public String viewChat(HttpSession session, Model model) {
    	
    	System.out.println("!!!!!");
    	System.out.println(session.getAttribute("id"));
//    	System.out.println(principal.getName());
//    	BuyerVO vo = new BuyerVO();
    	SellerVO vo = new SellerVO()	;
    	vo.setS_email((String) session.getAttribute("id"));
//    	vo.setB_email((String) session.getAttribute("id"));
//    	BuyerDao.selectBuyer(vo);
    	sellerDAO.chatsellerselect(vo);
    	
    	
    	
//    	BuyerVO vo = new BuyerVO();
//    	vo.setB_email((String)session.getAttribute("id"));
    	//BuyerDao.selectBuyer(vo);
    	
    	if(session.getAttribute("id")!= null) {
    		model.addAttribute("loginMember", sellerDAO.chatsellerselect(vo));
    		
    		return "buyer/Chatting";
    	}
    	else 
    		return "user/home";
    }

    /**
     * ?????? ???????????? ?????? ????????? ????????????
     * @param roomId
     * @param model
     * @param response
     * @throws JsonIOException
     * @throws IOException
     */
    @RequestMapping(value="{roomid}.do")
    public void messageList(@PathVariable String roomid, String userid, Model model, HttpServletResponse response) throws /*JsonIOException,*/ IOException {
        List<ChatMessage> mList = cService.messageList(roomid);
        response.setContentType("application/json; charset=utf-8");
        System.out.println("???????????? ??????");
        // ????????? ???????????? ?????? 0?????? ?????????
        ChatMessage message = new ChatMessage();
        message.setSentid(userid);
        message.setRoomid(roomid);
        cService.updateCount(message);
        
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(mList,response.getWriter());
    }
    
    @ResponseBody
    @RequestMapping(value="{chat_delete_roomid}_delete.do")
    public String chatDelete(@PathVariable String chat_delete_roomid, HttpServletResponse response) throws /*JsonIOException,*/ IOException {
    	System.out.println("????????? ???:::::::"+chat_delete_roomid);
    	int chatDelete = cService.chatroomDelete(chat_delete_roomid);
    	System.out.println(chatDelete==1 ? "???????????? ?????????????????????." : "?????? ??????");
    	String suc;
    	if(chatDelete ==1) {
    		 suc = "success";
    	}else {
    		suc = "fail";
    	}
    	return suc;
    }
    /**
     * ?????? ?????? ?????? ??? ??????
     * @param room
     * @param userEmail
     * @param masterNickname
     * @return
     */
    @ResponseBody
    @RequestMapping("/createChat.do")
    public String createChat(ChatRoom room, String userid, String ser_code, Model model){
    	// ??????????????? ????????? ???????????? ?????????/????????? ???????????? 
    	System.out.println("???????????? :::"+ser_code);
    	
    	ServiceVO svo = serviceDao.serviceSelect(ser_code);
		BuyerVO vo = new BuyerVO();
		vo.setB_email(userid);
		System.out.println(vo.getB_email());
		vo = BuyerDao.selectBuyer(vo);
		System.out.println("????????? ???????????? vo??? ||||||||" + vo);
		System.out.println("???????????? ????????? :::"+userid);
		
		vo.getB_email();
		 sellerDAO.SellerSelect(vo.getB_email());	
    	
//        ProductDTO p = pService.getRow(pno);
//        MemberDTO m =  mService.readMemberInfo(p.getUserid());
//        System.out.println("???????????? ????????? :::::"+userid+"?????? ???????????? ?????????:::"+m.getUserid());
        // ????????? ??????????????? ?????? 
//        System.out.println(userid.equals(m.getUserid()));
       
//        if(userid.equals(m.getUserid())) {
//        	return "nochat";
//        }
        
        // ?????????DTO??? ??? ?????? 
        room.setUserid(userid);
        room.setUsernickname(BuyerDao.selectBuyer(vo).getB_nickname());
        room.setMasterid(svo.getS_email());
       //room.setMasternickname(svo.());
 
        ChatRoom exist  = cService.searchChatRoom(room);
        
        // DB??? ?????? ?????? ???
        if(exist == null) {
            System.out.println("?????? ??????!!");
            int result = cService.createChat(room);
            if(result == 1) {
                System.out.println("??? ????????????!!");
                String room_id =cService.searchChatRoom(room).getRoomid(); 
                return room_id;
            }else {
                return "failRoom";
            }
        }
        // DB??? ?????? ?????? ???
        else{
            System.out.println("?????? ??????!!");
            String room_id =cService.searchChatRoom(room).getRoomid(); 
            return room_id;
        }
    }
    
    /**
     * ?????? ??? ?????? ????????????
     * @param room
     * @param userEmail
     * @param response
     * @throws JsonIOException
     * @throws IOException
     */
    @RequestMapping("/chatRoomList.do")
    public void createChat(ChatMessage message, String userid, HttpServletResponse response) throws JsonIOException, IOException{
        System.out.println("???????????? ????????? ????????? ::"+userid);
    	List<ChatRoom> cList = cService.chatRoomList(userid);
        
        for(int i = 0; i < cList.size(); i++) {
            message.setRoomid(cList.get(i).getRoomid());
            message.setSentid(userid);
            int count = cService.selectUnReadCount(message);
            cList.get(i).setUnReadCount(count);
        }
        
        response.setContentType("application/json; charset=utf-8");
 
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(cList,response.getWriter());
    }
    
    
    @RequestMapping("/chatSession.do")
    public void chatSession(HttpServletResponse response) throws JsonIOException, IOException{
        ArrayList<String> chatSessionList = ChatSession.getLoginUser(); // ?????? ???????????? ???????????? ????????? ??????
        
        response.setContentType("application/json; charset=utf-8");
 
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(chatSessionList,response.getWriter());
    }
    
    @ResponseBody
    @RequestMapping("/chatingcheck.do")
    public String chatingcheck(ChatRoom room,HttpSession session,@RequestParam("chatnick") String chatnick, 
    		@RequestParam("ser_code") String ser_code){
    String userid = (String) session.getAttribute("id");
    BuyerVO bvo = new BuyerVO();
    bvo.setB_email(userid); //?????????????????? ??????  buyer?????????
    BuyerVO buyer = BuyerDao.selectBuyer(bvo);
    System.out.println("?????????????????? ???????????? |||||||||"+buyer.getB_nickname());
    SellerVO vo = new SellerVO();
    //seller??? ????????? ??????
    vo.setB_email(userid);
    vo.setS_nickname(chatnick);
    //?????? ???????????????
    SellerVO svo = sellerDAO.SellerNickSelect(chatnick);
    
    //????????? ??????
    ServiceVO servo = serviceDao.serviceSelect(ser_code);
    	
    room.setUserid(userid);
    room.setUsernickname(buyer.getB_nickname());
    room.setB_img(buyer.getB_img());
    room.setMasterid(svo.getS_email());
    room.setMasternickname(svo.getS_nickname());
    room.setS_img(svo.getS_img());
    	
    ChatRoom exist = cService.searchChatRoom(room);
    	
    	if(exist == null) {
    		System.out.println("????????????!");
    		int result = cService.createChat(room);
    		if(result == 1) {
    			System.out.println("????????????");
    			String room_id = cService.searchChatRoom(room).getRoomid();
    			return room_id;
    		}else {
    			return "user/home";
    		}
    	}
    	//db??? ????????????
    	else {
    		System.out.println("????????????");
    		String room_id = cService.searchChatRoom(room).getRoomid();
    		return room_id;
    	}

    }
    
    //???????????? ?????? ?????????
    @ResponseBody
    @RequestMapping("/mainchatting.do")
    public String mainchatting(ChatRoom room,HttpSession session,@RequestParam("chatnick") String chatnick
    		){
    String userid = (String) session.getAttribute("id");
    BuyerVO bvo = new BuyerVO();
    bvo.setB_email(userid); //?????????????????? ??????  buyer?????????
    BuyerVO buyer = BuyerDao.selectBuyer(bvo);
    System.out.println("?????????????????? ???????????? |||||||||"+buyer.getB_nickname());
    SellerVO vo = new SellerVO();
    //seller??? ????????? ??????
    vo.setB_email(userid);
    vo.setS_nickname(chatnick);
    //?????? ???????????????
    SellerVO svo = sellerDAO.SellerNickSelect(chatnick);
    
    //????????? ??????
    	
    room.setUserid(userid);
    room.setUsernickname(buyer.getB_nickname());
    room.setMasterid(svo.getS_email());
    room.setMasternickname(svo.getS_nickname());
    	
    ChatRoom exist = cService.searchChatRoom(room);
    	
    	if(exist == null) {
    		System.out.println("????????????!");
    		int result = cService.createChat(room);
    		if(result == 1) {
    			System.out.println("????????????");
    			String room_id = cService.searchChatRoom(room).getRoomid();
    			return room_id;
    		}else {
    			return "user/home";
    		}
    	}
    	//db??? ????????????
    	else {
    		System.out.println("????????????");
    		String room_id = cService.searchChatRoom(room).getRoomid();
    		return room_id;
    	}

    }
    
    //???????????? ?????? ??????
    @ResponseBody
    @RequestMapping("/promotioncheck.do")
    public String promotioncheck(@RequestParam("promotioncheck") String promotion) {
    	
    	String n =cService.chatpromotion(promotion);
    	System.out.println("promotioncheck.do");
    	if(n != null) {
    		System.out.println("????????? n"+n);
    	}else {
    		System.out.println("??????????????? n??? |||||||||||||||" + n);
    	}
    	
    	return "";
    }
    
}