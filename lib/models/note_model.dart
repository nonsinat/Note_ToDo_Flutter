class Note {
  int? id;
  String? title;
  DateTime? date;
  String? priority;
  int? status;
  Note({
    this.title,
    this.date,
    this.priority,
    this.status,
  });
  Note.withId({this.id, this.title, this.date, this.priority, this.status});



  //** Convert Constructor note to Map */

  Map<String, dynamic> toMap() {
  
    final map = Map<String, dynamic>(); 
     if (id!=null) {
      map['id']=id  ;
    }
    map['title'] = this.title;
    map['date'] = this.date;
    map['priority'] = this.priority;
    map['status'] = this.status;
    return map;
  }

  //** Convert Map to List */

  factory Note.fromMap(Map<String,dynamic>map){
    return Note.withId(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      priority: map['priority'],
      status: map['status'],
    );
  }



}
