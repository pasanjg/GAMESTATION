package com.gamestation.service;

import java.sql.SQLException;
import java.util.ArrayList;
import com.gamestation.model.Contact;
import com.gamestation.model.User;


public interface IContactService {
	
public void addContact(Contact contact);
	
public ArrayList<Contact> getMessages();

public void deleteMessage(String messageID);
	
public ArrayList<String> getMessageIDs();


}
