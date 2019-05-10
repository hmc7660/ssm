package pers.hmc.bean;

import java.util.HashMap;
import java.util.Map;

import org.omg.CORBA.PUBLIC_MEMBER;

public class Message {
	
	private int status;
	
	private String message;
	
	private Map<String, Object> extend = new HashMap<String, Object>();
	
	public static Message success() {
		Message message = new Message();
		message.setStatus(200);
		message.setMessage("SUCCESS!");
		return message;
	}
	
	public static Message fail() {
		Message message = new Message();
		message.setStatus(400);
		message.setMessage("FAIL!");
		return message;
	}
	
	public Message add(String key, Object value) {
		this.getExtend().put(key, value);
		return this;
	}
	
	

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	
	

}
