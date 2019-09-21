package com.gamestation.service;

import java.util.ArrayList;
import com.gamestation.model.Contact;

public interface IContactService {

    public void addContact(Contact contact);

    public ArrayList<Contact> getMessages();

    public void deleteMessage(String messageID);

    public ArrayList<String> getMessageIDs();

}
