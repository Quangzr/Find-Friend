package jvb.dev.spring.model;

import java.util.Date;

public class ChatMessage {
	private int id;
	private int id_from;
	private int id_to;
	private Date time;
	private String from;
	private String text;

	private MessageType type;
	private String content;
	private String sender;

	public ChatMessage() {
		super();
	}

	public enum MessageType {
		CHAT, JOIN, LEAVE
	}

	public ChatMessage(int id, int id_from, int id_to, Date time, String from, String text, MessageType type,
			String content, String sender) {
		super();
		this.id = id;
		this.id_from = id_from;
		this.id_to = id_to;
		this.time = time;
		this.from = from;
		this.text = text;
		this.type = type;
		this.content = content;
		this.sender = sender;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_from() {
		return id_from;
	}

	public void setId_from(int id_from) {
		this.id_from = id_from;
	}

	public int getId_to() {
		return id_to;
	}

	public void setId_to(int id_to) {
		this.id_to = id_to;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public MessageType getType() {
		return type;
	}

	public void setType(MessageType type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

}
