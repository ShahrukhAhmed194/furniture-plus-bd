<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Product\Cart;
use App\Models\Product\Product;
use App\Models\Product\ProductData;
use App\Repositories\CartRepo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use function PHPUnit\Framework\isFalse;

class CartController extends Controller
{
    public function cart(){
        // Refresh
        CartRepo::refresh();

        $carts = CartRepo::summary();
        return view('front.cart', compact('carts'));
    }
    public function add(Request $request){
        try {
            $quantity = $request->quantity ?? 1;
            $summary = $this->storeCart($request->product_id, $quantity, ($request->product_data_id ?? null));

            return [
                'status' => true,
                'cart_count' => $summary['count'] ?? 0
            ];
        }catch (\Exception $e){
            return [
                'status' => true,
                'cart_count' => 0
            ];
        }

    }

    public function directOrder(request $request){
        if(!$request->product){
            return view('front.not-found-page');
        }
        try {
            $quantity = $request->quantity ?? 1;
            $this->storeCart($request->product, $quantity, $request->product_data_id);

            return redirect()->route('cart')->with('success-alert', 'Card added success!');
        }catch (\Exception $e){
            return view('front.not-found-page');
        }

    }

    public function storeCart($product_id, $quantity, $data_id = null){
        $product = Product::find($product_id);
        if($data_id){
            $product_data = ProductData::find($data_id);
        }else{
            if($product->type == 'Variable'){
                $product_data = $product->VariableProductData[0];
            }else{
                $product_data = $product->ProductData;
            }
        }
        // if($product_data && $product_data->stock < 1){
        //     return [
        //         'status' => false,
        //         'text' => 'Out of Stock!',
        //         'cart_summary' => false,
        //         'new_item' => ''
        //     ];
        // }

        $session_id = Session::getId();

        $cart = Cart::query();
        if(auth()->check()){
            $cart->where('user_id', auth()->user()->id);
        }else{
            $cart->where('session_id', $session_id);
        }
        $cart = $cart->where('product_id', $product_id)->where('product_data_id', $product_data->id)->first();

        if($cart){
            return '0';
        }

        $cart = new Cart;

        if(auth()->check()){
            $cart->user_id = auth()->user()->id;
        }else{
            $cart->session_id = $session_id;
        }
        $cart->product_id = $product_id;
        $cart->product_data_id = $product_data->id;
        $cart->quantity = $quantity > 0 ? $quantity : 1;
        $cart->save();

        return CartRepo::summary();
    }

    public function remove($id){
        $cart = Cart::find($id);

        if(isset($cart->id)){
            $cart->delete();
        }
        return redirect()->back()->with('success-alert', 'Cart deleted!');
    }

    public function update(Request $request){
        try {
            $cart = Cart::find($request->cart_id);
            if(isset($cart->id)){
                $cart->quantity = $request->quantity;
                $cart->save();
            }

            return [
                'summary' => CartRepo::summary(),
                'single_amount' => $cart->ProductData->sale_price * $cart->quantity
            ];
        }catch (\Exception $e){
            return [];
        }

    }

    public function checkout(){
        return view('front.checkout');
    }
}
