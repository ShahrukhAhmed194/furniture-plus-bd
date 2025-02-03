<form action="{{route('order')}}" method="POST" class="grid grid-cols-1 md:grid-cols-8 gap-4 checkoutForm">

    <div class="bg-white border rounded col-span-1 md:col-span-4 lg:col-span-3">
        <h2 class="text-xl font-medium mb-2 bg-gray-200 p-2">Customer Information</h2>

        <div class="p-4">
            @csrf

            <div class="mb-4">
                <label class="block text-font-color-dark text-sm font-bold mb-2">Your Name*</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-font-color-dark leading-tight focus:shadow-outline @error('name') border-red-500 @enderror" type="text" name="name" value="{{old('name', (auth()->user()->full_name ?? ''))}}" placeholder="Your Name">

                @error('name')
                <span class="invalid-feedback block" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                @enderror
            </div>

            <div class="mb-4">
                <label class="block text-font-color-dark text-sm font-bold mb-2">Mobile Number*</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-font-color-dark leading-tight focus:shadow-outline mobile_number @error('mobile_number') border-red-500 @enderror" type="number" name="mobile_number" value="{{old('mobile_number', (auth()->user()->mobile_number ?? ''))}}" placeholder="Mobile Number">

                @error('mobile_number')
                <span class="invalid-feedback block" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                @enderror
            </div>

            <div class="mb-4">
                <label class="block text-font-color-dark text-sm font-bold mb-2">Address*</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-font-color-dark leading-tight focus:shadow-outline @error('address') border-red-500 @enderror" type="text" name="address" value="{{old('address', (auth()->user()->address ?? ''))}}" placeholder="Address">

                @error('address')
                <span class="invalid-feedback block" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                @enderror
            </div>

            <div class="mb-4">
                <label class="block text-font-color-dark text-sm font-bold mb-2">Choose Your Area*</label>
                <select name="ares" class="shadow appearance-none border rounded w-full py-2 px-3 text-font-color-dark leading-tight focus:shadow-outline @error('address') border-red-500 @enderror change_area" required>
                    <option value="Inside Dhaka">Inside Dhaka</option>
                    <option value="Outside Dhaka">Outside Dhaka</option>
                </select>
            </div>

            <div class="mt-6">
                <button type="submit" class="text-center rounded-md border-2 border-primary bg-primary px-6 py-2 text-base font-medium text-font-color-light shadow-sm hover:bg-white hover:text-primary block w-full text-white">Confirm Order</button>
            </div>
        </div>
    </div>

    <div class="bg-white border rounded col-span-1 md:col-span-4 lg:col-span-5">
        <h2 class="text-xl font-medium mb-2 bg-gray-200 p-2">Order Information</h2>

        <div class="p-4">
            <div class="py-2 md-py-6">
                <div class="mt-8">
                    <div class="flow-root">
                        <ul role="list" class="-my-6 divide-y divide-gray-200">
                            @foreach ($carts['carts'] as $cart)
                                @if($cart->Product)
                                    <li class="flex py-6">
                                        <div class="h-24 w-24 flex-shrink-0 overflow-hidden rounded-md border border-gray-200">
                                            <img src="{{$cart->Product->img_paths['small']}}" alt="{{$cart->Product->title}}" class="h-full w-full object-cover object-center">
                                        </div>

                                        <div class="ml-4 flex flex-1 flex-col">
                                            <div>
                                                <div class="flex justify-between text-base font-medium text-font-color-dark">
                                                    <h3 class="">
                                                        <a href="{{$cart->Product->route}}">{{$cart->Product->title}}</a>

                                                        @if($cart->Product->type == 'Variable')
                                                            <p class="mb-0"><small>{{$cart->ProductData->attribute_items_string ?? ''}}</small></p>
                                                        @endif
                                                    </h3>
                                                    <p class="ml-4">৳<span class="single_cart_amount">{{$cart->Product->prices['sale_price'] * $cart->quantity}}</span></p>
                                                </div>

                                                <div class="flex">
                                                    <a href="{{route('cart.remove', $cart->id)}}" class="mt-1 text-sm text-font-color-dark hover:text-red-700 cursor-pointer"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                                            <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                                                        </svg>
                                                    </a>

                                                    <div class="flex mt-1 ml-2 md:ml-5 cart_qty_wrap">
                                                        <button type="button" class="w-6 h-6 text-center border-2 border-primary cursor-pointer font-bold border-l-0 bg-primary text-white updateCart" data-type="minus" data-id="{{$cart->id}}">-</button>
                                                        <input type="number" value="{{$cart->quantity}}" class="h-6 border-2 border-primary px-1 w-10 focus:outline-none updateCartQty" readonly>
                                                        <button type="button" class="w-6 h-6 text-center border-2 border-primary cursor-pointer font-bold border-r-0 bg-primary text-white updateCart" data-type="plus" data-id="{{$cart->id}}">+</button>
                                                    </div>
                                                </div>
                                            </div>


                                            {{-- <div class="flex flex-1 items-end justify-between text-sm">
                                                <p>Qty: {{$cart->quantity}}</p>
                                            </div> --}}
                                        </div>
                                    </li>
                                @endif
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="border-t border-gray-200 py-2 md-py-6 xl:pt-2 px-4 sm:px-6">
            <div class="flex justify-between border-b text-base font-medium text-font-color-dark">
                <p>Subtotal</p>
                <p>৳<span class="product_total">{{$carts['product_total']}}</span></p>
            </div>
            <div id="payment_method_area" class="flex justify-between border-b text-base font-medium text-font-color-dark">
                <p>Payment Method: </p>
                <p>Cash On Delivery</p>
            </div>
            <div class="flex justify-between border-b text-base font-medium text-font-color-dark">
                <p>Shipping Charge: </p>
                <p class="shipping_charge_text">{{env("INSIDE_DHAKA_DELIVERY_CHARGE", 60)}}</p>
            </div>
            <div class="flex justify-between border-b text-base font-medium text-font-color-dark">
                <p>Grand Total: </p>
                <p>৳<span class="grand_total">{{$carts['product_total'] + env("INSIDE_DHAKA_DELIVERY_CHARGE", 60)}}</span></p>
            </div>

            <input type="hidden" name="shipping_charge" class="shipping_charge" value="{{env("INSIDE_DHAKA_DELIVERY_CHARGE", 60)}}">

            <div class="mt-6">
                <a href="{{route('homepage')}}" class="text-center rounded-md border-2 border-primary-light bg-primary-light px-3 py-0.5 text-sm font-medium text-white float-right mb-3">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 inline-block">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18" />
                    </svg>

                    Back To Shopping
                </a>
            </div>
        </div>
    </div>

</form>
