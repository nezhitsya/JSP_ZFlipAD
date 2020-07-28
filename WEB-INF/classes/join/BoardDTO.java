package join;

public class BoardDTO {
  private String id;
  private String subject;
  private String name;
  private String content;
  private int hitcount;
  private String created;
  private int num;

  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }

  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    this.subject = subject;
  }

  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }

  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }

  public Integer getHitcount() {
    return hitcount;
  }
  public void setHitcount(Integer hitcount) {
    this.hitcount = hitcount;
  }

  public String getCreated() {
    return created;
  }
  public void setCreated(String created) {
    this.created = created;
  }

  public Integer getNum() {
    return num;
  }
  public void setNum(Integer num) {
    this.num = num;
  }
}
