class Doctor {
  final String? name;
  final String? email;
  final String? desc;
  final String? location;
  final String? address;
  Doctor({
    this.name,
    this.email,
    this.desc,
    this.location,
    this.address,
  });

  Doctor copyWith({
    String? name,
    String? email,
    String? desc,
    String? location,
    String? address,
  }) {
    return Doctor(
      name: name ?? this.name,
      email: email ?? this.email,
      desc: desc ?? this.desc,
      location: location ?? this.location,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'desc': desc,
      'location': location,
      'address': address,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      name: map['name'] != null ? map['name'] as String : "",
      email: map['email'] != null ? map['email'] as String : "",
      desc: map['description'] != null ? map['description'] as String : "",
      location: map['location'] != null ? map['location'] as String : "",
      address: map['address'] != null ? map['address'] as String : "",
    );
  }

  @override
  String toString() {
    return 'Doctor(name: $name, email: $email, desc: $desc, location: $location, address: $address)';
  }

  @override
  bool operator ==(covariant Doctor other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.desc == desc &&
        other.location == location &&
        other.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        desc.hashCode ^
        location.hashCode ^
        address.hashCode;
  }
}
