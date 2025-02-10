<form action="{{route('order')}}" method="POST" class="grid grid-cols-1 md:grid-cols-8 gap-4 checkoutForm">

    <div class="bg-white border rounded col-span-1 md:col-span-4 lg:col-span-5">
        <h2 class="text-xl font-medium mb-2 bg-gray-200 p-2">Order Information</h2>

        <div class="p-4">
            <div class="py-2 md-py-6">
                <div class="mt-8">
                    <div class="flow-root">
                        <ul role="list" class="-my-6 divide-y divide-gray-200">
                            @foreach ($carts['carts'] as $cart)
                                @if($cart->Product)
                                    <li>
                                        <!-- product cart -->
                                        <div class="rounded-lg border border-gray-200 bg-white p-4 shadow-sm md:p-6">
                                            <div class="space-y-4 md:flex md:items-center md:justify-between md:gap-6 md:space-y-0">
                                                <a href="{{ $cart->product->route }}" class="shrink-0 md:order-1">
                                                    <img class="h-20 w-20" src="{{$cart->Product->img_paths['small']}}" alt="{{$cart->Product->title}}" />
                                                </a>

                                                <label for="counter-input" class="sr-only">Choose quantity:</label>
                                                <div class="flex items-center justify-between md:order-3 md:justify-end cart_qty_wrap">
                                                    <div class="flex items-center">
                                                        <button type="button"  class="inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-md border border-gray-300 bg-gray-100 hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-100 updateCart" data-type="minus" data-id="{{$cart->id}}">
                                                            <svg class="h-2.5 w-2.5 text-gray-900" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 2">
                                                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h16" />
                                                            </svg>
                                                        </button>
                                                        <input type="text" class="w-10 shrink-0 border-0 bg-transparent text-center text-sm font-medium text-gray-900 focus:outline-none focus:ring-0 updateCartQty" value="{{$cart->quantity}}"  readonly />
                                                        <button type="button"  class="inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-md border border-gray-300 bg-gray-100 hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-100 updateCart" data-type="plus" data-id="{{$cart->id}}">
                                                            <svg class="h-2.5 w-2.5 text-gray-900" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">
                                                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 1v16M1 9h16" />
                                                            </svg>
                                                        </button>
                                                    </div>
                                                    <div class="text-end md:order-4 md:w-32">
                                                        <p class="text-base font-bold text-gray-900">৳<span class="single_cart_amount">{{$cart->Product->prices['sale_price'] * $cart->quantity}}</span></p>
                                                    </div>
                                                </div>

                                                <div class="w-full min-w-0 flex-1 space-y-4 md:order-2 md:max-w-md">
                                                    <a href="#" class="text-lg text-gray-900 hover:underline font-semibold">{{$cart->Product->title}}</a>
                                                    @if($cart->Product->type == 'Variable')
                                                        <p class="mb-0"><small>{{$cart->ProductData->attribute_items_string ?? ''}}</small></p>
                                                    @endif
                                                    <div class="flex items-center gap-4">

                                                        <a href="{{route('cart.remove', $cart->id)}}" class="inline-flex items-center text-sm font-medium text-red-600 hover:underline dark:text-red-500">
                                                            <svg class="me-1.5 h-5 w-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                                                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18 17.94 6M18 18 6.06 6" />
                                                            </svg>
                                                            Remove
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- product cart end -->
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
            <div id="payment_method_area" class="hidden flex justify-between border-b text-base font-medium text-font-color-dark">
                <p>Payment Method: </p>
                <p>Cash On Delivery</p>
            </div>
            <div class="flex justify-between border-b text-base font-medium text-font-color-dark">
                <p>Shipping Charge: </p>
                <p class="shipping_charge_text">{{env("OUTSIDE_DHAKA_DELIVERY_CHARGE", 60)}}</p>
            </div>
            <div class="flex justify-between border-b text-base font-medium text-font-color-dark">
                <p>Grand Total: </p>
                <p>৳<span class="grand_total">{{$carts['product_total'] + env("OUTSIDE_DHAKA_DELIVERY_CHARGE", 60)}}</span></p>
            </div>

            <input type="hidden" name="shipping_charge" class="shipping_charge" value="{{env("OUTSIDE_DHAKA_DELIVERY_CHARGE", 60)}}">

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
                    <option value="Outside Dhaka">Outside Dhaka</option>
                    <option value="Inside Dhaka">Inside Dhaka</option>
                </select>
            </div>

            <div class="mt-6">
                <button type="submit" class="text-center rounded-md border-1 border-primary bg-primary px-6 py-2 text-base font-medium text-font-color-light shadow-sm hover:ring-1 hover:ring-teal-500 hover:text-yellow-500 hover:bg-white block w-full text-white">
                    Confirm Order
                </button>
            </div>
            
            
        </div>
    </div>

</form>
