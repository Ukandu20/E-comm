class cartItem{
    constructor(id, price, name, img){
        this.id = id
        this.name = name;
        this.price = price;
        this.img = img;
        this.qty = 1;
    }
}
if (localStorage) {
    var items = new Map();
    var cart_items = new Map();
}
else{
    console.log("local storage error");
}

var total = 0.00;
var row_total = 1;
var products_in_cart = 0;
/*
-store items in array
use push to add items
remake shoping cart
change the params then build the object in function
add to cart function works
make cart does not
*/
function addToCart(id,price,name,img){
    console.log("added!");
    if (localStorage.getItem("items") == '' || localStorage.getItem("items")==null) {
        localStorage.setItem("items",'[]');
    }
    var storage = JSON.parse(localStorage.getItem("items"));
    var prod = new cartItem(id,price,name,img);
    storage.push(prod);
    localStorage.setItem("items",JSON.stringify(storage));
    products_in_cart++;
    
    var content =` 
        <tr id="${prod.name}">
            <td class="shoping__cart__item">
                <img src="${prod.img}" alt="product image">
                <h5>${prod.name}</h5>
            </td>
            <td class="shoping__cart__price">
                $${prod.price}
            </td>
            <td class="shoping__cart__quantity">
                <div class="quantity">
                    <div class="pro-qty">
                        <input type="number" value="1" min="1">
                    </div>
                </div>
            </td>
            <td class="shoping__cart__total">
            $${prod.price}
            </td>
            <td class="shoping__cart__item__close">
                <span class="icon_close" onclick="removeItem('${prod.id}')"></span>
            </td>
        </tr>`
        var page = document.getElementById("cart_body");
        total+=prod.price;
        var row = document.createElement('tr');
        row.innerHTML = content;
        page.append(row);
        products_in_cart++;
        document.getElementById("products-in-cart").innerHTML = products_in_cart;
        document.getElementById("cart-subtotal").innerHTML ="$"+ (Math.round(total * 100) / 100).toFixed(2);
        document.getElementById("cart-total").innerHTML = "$"+(Math.round(total * 1.13 * 100) / 100).toFixed(2);
        console.log("adding item" + prod.name);
}

function makeCart() {
    document.getElementsByClassName("cart_body").innerHTML = "";
    console.log("running!");
    var page = document.getElementById("cart_body");
    temp = localStorage.getItem("items");
    var cart = JSON.parse(temp);
    console.log(cart);
    for (let i = 0; i < cart.length; i++) {
        const product = cart[i];
        var content =` 
        <tr id="${product.name}">
            <td class="shoping__cart__item">
                <img src="${product.img}" alt="product image">
                <h5>${product.name}</h5>
            </td>
            <td class="shoping__cart__price">
                $${product.price}
            </td>
            <td class="shoping__cart__quantity">
                <div class="quantity">
                    <div class="pro-qty">
                        <input type="number" value="1" min="1">
                    </div>
                </div>
            </td>
            <td class="shoping__cart__total">
            $${product.price}
            </td>
            <td class="shoping__cart__item__close">
                <span class="icon_close" onclick="removeItem('${product.id}')"></span>
            </td>
        </tr>`
        total+=product.price;
        var row = document.createElement('tr');
        row.innerHTML = content;
        page.append(row);
        products_in_cart++;
        document.getElementById("products-in-cart").innerHTML = products_in_cart;
        document.getElementById("cart-subtotal").innerHTML ="$"+ (Math.round(total * 100) / 100).toFixed(2);
        document.getElementById("cart-total").innerHTML = "$"+(Math.round(total * 1.13 * 100) / 100).toFixed(2);
        console.log("adding item" + product.name);
    
    }
}
function removeItem(id){
    console.log("working");
    
    var storage = JSON.parse(localStorage.getItem("items"));

    total = 0;
    var new_storage = new Array();
    console.log("the id is " + id);
    for (let i = 0; i < storage.length; i++) {
        var element = storage[i];
        console.log(element);
        if (element.id != id) {
            new_storage.push(element);
        }
        else{
            total-=element.price;
        }
    }
    console.log(new_storage);  
    localStorage.clear();
    localStorage.setItem("items",JSON.stringify(new_storage));
        document.getElementById("cart_body").innerHTML = "";
    products_in_cart = 0;
    for (let i = 0; i < new_storage.length; i++) {
        const element = new_storage[i];
        total+=element.price;
        products_in_cart++;
        addToCart(element.id,element.price,element.name,element.img);
    }
    
    products_in_cart--;
    document.getElementById("products-in-cart").innerHTML = products_in_cart;
    document.getElementById("cart-subtotal").innerHTML ="$"+ (Math.round(total * 100) / 100).toFixed(2);
    document.getElementById("cart-total").innerHTML = "$"+(Math.round(total * 1.13 * 100) / 100).toFixed(2);
    console.log(total);
    
}