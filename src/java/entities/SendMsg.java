/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "send_msg")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SendMsg.findAll", query = "SELECT s FROM SendMsg s")
    , @NamedQuery(name = "SendMsg.findBySenderId", query = "SELECT s FROM SendMsg s WHERE s.senderId = :senderId")
    , @NamedQuery(name = "SendMsg.findByReceiverId", query = "SELECT s FROM SendMsg s WHERE s.receiverId = :receiverId")
    , @NamedQuery(name = "SendMsg.findByMsgId", query = "SELECT s FROM SendMsg s WHERE s.msgId = :msgId")})
public class SendMsg implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "senderId")
    private int senderId;
    @Basic(optional = false)
    @Column(name = "receiverId")
    private int receiverId;
    @Id
    @Basic(optional = false)
    @Column(name = "msgId")
    private Integer msgId;
    @JoinColumn(name = "msgId", referencedColumnName = "id", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Message message;

    public SendMsg() {
    }

    public SendMsg(Integer msgId) {
        this.msgId = msgId;
    }

    public SendMsg(Integer msgId, int senderId, int receiverId) {
        this.msgId = msgId;
        this.senderId = senderId;
        this.receiverId = receiverId;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    public Integer getMsgId() {
        return msgId;
    }

    public void setMsgId(Integer msgId) {
        this.msgId = msgId;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (msgId != null ? msgId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SendMsg)) {
            return false;
        }
        SendMsg other = (SendMsg) object;
        if ((this.msgId == null && other.msgId != null) || (this.msgId != null && !this.msgId.equals(other.msgId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.SendMsg[ msgId=" + msgId + " ]";
    }

}
