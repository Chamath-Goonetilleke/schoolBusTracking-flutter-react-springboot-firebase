package com.backend.hopeOn.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity(name = "chat_message")
@Getter
@Setter
public class ChatMessage extends AbstractEntity{

    private String sender;
    private String content;
    private boolean isMe;
}

