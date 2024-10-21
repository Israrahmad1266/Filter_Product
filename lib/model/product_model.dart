// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    bool succ;
    String publicMsg;
    Products products;
    List<Cat> cats;

    Product({
        required this.succ,
        required this.publicMsg,
        required this.products,
        required this.cats,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        succ: json["succ"],
        publicMsg: json["public_msg"],
        products: Products.fromJson(json["products"]),
        cats: List<Cat>.from(json["cats"].map((x) => Cat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "succ": succ,
        "public_msg": publicMsg,
        "products": products.toJson(),
        "cats": List<dynamic>.from(cats.map((x) => x.toJson())),
    };
}

class Cat {
    String title;
    String slug;
    String fullUrl;
    String shortDesc;
    FeaturedImg featuredImg;

    Cat({
        required this.title,
        required this.slug,
        required this.fullUrl,
        required this.shortDesc,
        required this.featuredImg,
    });

    factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        title: json["title"],
        slug: json["slug"],
        fullUrl: json["fullURL"],
        shortDesc: json["short_desc"],
        featuredImg: FeaturedImg.fromJson(json["featured_img"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "fullURL": fullUrl,
        "short_desc": shortDesc,
        "featured_img": featuredImg.toJson(),
    };
}

class FeaturedImg {
    int id;
    String altText;
    String title;
    dynamic caption;
    String publicUrl;
    String thumbnailUrl;

    FeaturedImg({
        required this.id,
        required this.altText,
        required this.title,
        required this.caption,
        required this.publicUrl,
        required this.thumbnailUrl,
    });

    factory FeaturedImg.fromJson(Map<String, dynamic> json) => FeaturedImg(
        id: json["id"],
        altText: json["alt_text"],
        title: json["title"],
        caption: json["caption"],
        publicUrl: json["public_url"],
        thumbnailUrl: json["thumbnail_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "alt_text": altText,
        "title": title,
        "caption": caption,
        "public_url": publicUrl,
        "thumbnail_url": thumbnailUrl,
    };
}

class Products {
    int currentPage;
    List<Datum> data;
    String firstPageUrl;
    int from;
    int lastPage;
    String lastPageUrl;
    List<Link> links;
    String nextPageUrl;
    String path;
    int perPage;
    dynamic prevPageUrl;
    int to;
    int total;

    Products({
        required this.currentPage,
        required this.data,
        required this.firstPageUrl,
        required this.from,
        required this.lastPage,
        required this.lastPageUrl,
        required this.links,
        required this.nextPageUrl,
        required this.path,
        required this.perPage,
        required this.prevPageUrl,
        required this.to,
        required this.total,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    int productId;
    Type type;
    String sku;
    int taxEnabled;
    int stockManage;
    int stockQuantity;
    bool isOutOfStock;
    Review review;
    Entity entity;
    Price price;
    List<Variation>? variations;

    Datum({
        required this.productId,
        required this.type,
        required this.sku,
        required this.taxEnabled,
        required this.stockManage,
        required this.stockQuantity,
        required this.isOutOfStock,
        required this.review,
        required this.entity,
        required this.price,
        this.variations,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        type: typeValues.map[json["type"]]!,
        sku: json["sku"],
        taxEnabled: json["tax_enabled"],
        stockManage: json["stock_manage"],
        stockQuantity: json["stock_quantity"],
        isOutOfStock: json["is_out_of_stock"],
        review: Review.fromJson(json["review"]),
        entity: Entity.fromJson(json["entity"]),
        price: Price.fromJson(json["price"]),
        variations: json["variations"] == null ? [] : List<Variation>.from(json["variations"]!.map((x) => Variation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "type": typeValues.reverse[type],
        "sku": sku,
        "tax_enabled": taxEnabled,
        "stock_manage": stockManage,
        "stock_quantity": stockQuantity,
        "is_out_of_stock": isOutOfStock,
        "review": review.toJson(),
        "entity": entity.toJson(),
        "price": price.toJson(),
        "variations": variations == null ? [] : List<dynamic>.from(variations!.map((x) => x.toJson())),
    };
}

class Entity {
    String title;
    String slug;
    String fullUrl;
    String? shortDesc;
    FeaturedImg featuredImg;
    MetaData metaData;
    String? attr;

    Entity({
        required this.title,
        required this.slug,
        required this.fullUrl,
        required this.shortDesc,
        required this.featuredImg,
        required this.metaData,
        this.attr,
    });

    factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        title: json["title"],
        slug: json["slug"],
        fullUrl: json["fullURL"],
        shortDesc: json["short_desc"],
        featuredImg: FeaturedImg.fromJson(json["featured_img"]),
        metaData: MetaData.fromJson(json["meta_data"]),
        attr: json["attr"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "fullURL": fullUrl,
        "short_desc": shortDesc,
        "featured_img": featuredImg.toJson(),
        "meta_data": metaData.toJson(),
        "attr": attr,
    };
}

class MetaData {
    PageContainer pageContainer;
    dynamic showBreadcrumb;
    String? chukdeorigin;
    String? flavour;
    String? cookinguses;
    String? chukdeadvantage;
    String? bestSellerEnabled;

    MetaData({
        required this.pageContainer,
        required this.showBreadcrumb,
        required this.chukdeorigin,
        required this.flavour,
        required this.cookinguses,
        required this.chukdeadvantage,
        this.bestSellerEnabled,
    });

    factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        pageContainer: pageContainerValues.map[json["page_container"]]!,
        showBreadcrumb: json["show_breadcrumb"],
        chukdeorigin: json["chukdeorigin"],
        flavour: json["flavour"],
        cookinguses: json["cookinguses"],
        chukdeadvantage: json["chukdeadvantage"],
        bestSellerEnabled: json["best_seller_enabled"],
    );

    Map<String, dynamic> toJson() => {
        "page_container": pageContainerValues.reverse[pageContainer],
        "show_breadcrumb": showBreadcrumb,
        "chukdeorigin": chukdeorigin,
        "flavour": flavour,
        "cookinguses": cookinguses,
        "chukdeadvantage": chukdeadvantage,
        "best_seller_enabled": bestSellerEnabled,
    };
}

enum PageContainer {
    CONTAINER
}

final pageContainerValues = EnumValues({
    "container": PageContainer.CONTAINER
});

class Price {
    Curr curr;
    CurrInfo currInfo;
    bool isOnSale;
    int regular;
    bool isTaxIncluded;
    int sale;
    int min;
    int max;
    Off off;

    Price({
        required this.curr,
        required this.currInfo,
        required this.isOnSale,
        required this.regular,
        required this.isTaxIncluded,
        required this.sale,
        required this.min,
        required this.max,
        required this.off,
    });

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        curr: currValues.map[json["curr"]]!,
        currInfo: CurrInfo.fromJson(json["curr_info"]),
        isOnSale: json["is_on_sale"],
        regular: json["regular"],
        isTaxIncluded: json["isTaxIncluded"],
        sale: json["sale"],
        min: json["min"],
        max: json["max"],
        off: offValues.map[json["off"]]!,
    );

    Map<String, dynamic> toJson() => {
        "curr": currValues.reverse[curr],
        "curr_info": currInfo.toJson(),
        "is_on_sale": isOnSale,
        "regular": regular,
        "isTaxIncluded": isTaxIncluded,
        "sale": sale,
        "min": min,
        "max": max,
        "off": offValues.reverse[off],
    };
}

enum Curr {
    INR
}

final currValues = EnumValues({
    "inr": Curr.INR
});

class CurrInfo {
    bool defaultCurr;
    int currValue;
    Prefix prefix;
    Suffix suffix;
    int decimals;

    CurrInfo({
        required this.defaultCurr,
        required this.currValue,
        required this.prefix,
        required this.suffix,
        required this.decimals,
    });

    factory CurrInfo.fromJson(Map<String, dynamic> json) => CurrInfo(
        defaultCurr: json["default_curr"],
        currValue: json["curr_value"],
        prefix: prefixValues.map[json["prefix"]]!,
        suffix: suffixValues.map[json["suffix"]]!,
        decimals: json["decimals"],
    );

    Map<String, dynamic> toJson() => {
        "default_curr": defaultCurr,
        "curr_value": currValue,
        "prefix": prefixValues.reverse[prefix],
        "suffix": suffixValues.reverse[suffix],
        "decimals": decimals,
    };
}

enum Prefix {
    EMPTY
}

final prefixValues = EnumValues({
    "₹": Prefix.EMPTY
});

enum Suffix {
    EMPTY
}

final suffixValues = EnumValues({
    "/-": Suffix.EMPTY
});

enum Off {
    THE_0_OFF
}

final offValues = EnumValues({
    "0% off": Off.THE_0_OFF
});

class Review {
    String allowed;
    dynamic reviewCount;
    String? avgRating;

    Review({
        required this.allowed,
        this.reviewCount,
        this.avgRating,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        allowed: json["allowed"],
        reviewCount: json["review_count"],
        avgRating: json["avg_rating"],
    );

    Map<String, dynamic> toJson() => {
        "allowed": allowed,
        "review_count": reviewCount,
        "avg_rating": avgRating,
    };
}

enum Type {
    SIMPLE,
    VARIABLE
}

final typeValues = EnumValues({
    "simple": Type.SIMPLE,
    "variable": Type.VARIABLE
});

class Variation {
    int productId;
    int variationId;
    String type;
    String sku;
    bool isOutOfStock;
    int catalogVisibility;
    DefaultAttributes defaultAttributes;
    Price price;
    String variationString;

    Variation({
        required this.productId,
        required this.variationId,
        required this.type,
        required this.sku,
        required this.isOutOfStock,
        required this.catalogVisibility,
        required this.defaultAttributes,
        required this.price,
        required this.variationString,
    });

    factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        productId: json["product_id"],
        variationId: json["variation_id"],
        type: json["type"],
        sku: json["sku"],
        isOutOfStock: json["is_out_of_stock"],
        catalogVisibility: json["catalog_visibility"],
        defaultAttributes: DefaultAttributes.fromJson(json["default_attributes"]),
        price: Price.fromJson(json["price"]),
        variationString: json["variation_string"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "variation_id": variationId,
        "type": type,
        "sku": sku,
        "is_out_of_stock": isOutOfStock,
        "catalog_visibility": catalogVisibility,
        "default_attributes": defaultAttributes.toJson(),
        "price": price.toJson(),
        "variation_string": variationString,
    };
}

class DefaultAttributes {
    String weight;

    DefaultAttributes({
        required this.weight,
    });

    factory DefaultAttributes.fromJson(Map<String, dynamic> json) => DefaultAttributes(
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "weight": weight,
    };
}

class Link {
    String? url;
    String label;
    bool active;

    Link({
        required this.url,
        required this.label,
        required this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
