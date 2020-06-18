class Currency {
    String base;
    String quote;
    double rate;
    String time;

    Currency({this.base, this.quote, this.rate, this.time});

    factory Currency.fromJson(Map<String, dynamic> json) {
        return Currency(
            base: json['asset_id_base'],
            quote: json['asset_id_quote'],
            rate: json['rate'],
            time: json['time'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['asset_id_base'] = this.base;
        data['asset_id_quote'] = this.quote;
        data['rate'] = this.rate;
        data['time'] = this.time;
        return data;
    }
}