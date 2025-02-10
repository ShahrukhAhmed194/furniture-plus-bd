<div class="{{ isset($key) && $key >3 ? 'hidden md:block':'' }} component component-CerCheckBox bg-transparent overflow-hidden border border-gray-200 border-t-0 border-l-0 border-r-1 border-b-0">
    <div class="h-100 h-full flex flex-col">

        <div class="flex-1">
            <a href="{{$product->route}}" class="hover:underline overflow-hidden transition-all bg-transparent ">
                <img class="md:max-w-[200px] mx-auto hover:scale-110 transition-all duration-500 object-cover ob object-fit" src="{{$product->img_paths['medium']}}" alt="{{$product->title}}" />
            </a>
            <div class="p-1">
                <div class="flex items-baseline">
                    @if($product->custom_label)
                        <span class="inline-block bg-teal-200 text-teal-800 py-1 mr-2 px-2 md:px-4 text-xs rounded-full uppercase font-semibold ">{{$product->custom_label}}</span>
                    @endif
                </div>
                <h2 class="mt-2 md:mt-3 font-bold leading-tight text-sm md:text-md xl:text-lg">
                    <a href="{{$product->route}}" class="hover:underline transition-all">{{ $product->title  }}</a>
                </h2>
            </div>
        </div>
        <div class="py-1 px-2">
            <div class="">
                @if($product->type && $product->type=="Variable" && count($product->VariableProductData))
                    <div class="items-start">
                    <span class="text-teal-600 font-semibold text-sm md:text-lg mx-0">
                        <span>{{ $product->VariableProductData[0]['unit_amount']??1 }}</span>
                    </span>
                        <span class="text-gray-600 text-sm">{{ $product->VariableProductData[0]['unit']??'Pcs' }}</span>
                    </div>
                @else
                    <div class="items-start">
                    <span class="text-teal-600 font-semibold text-sm md:text-lg mx-0">
                        <span>{{ $product->productData['unit_amount']??1 }}</span>
                    </span>
                        <span class="text-gray-600 text-sm">{{ $product->productData['unit']??'Pcs' }}</span>
                    </div>
                @endif

                <div class="flex items-start flex-col md:flex-row mt-0 mb-3">
                    <div class="text-sm md:text-lg">
                        <div class="flex items-start">
                            <span class="font-bold">{{ $settings_g['currency_symbol'] ?? '৳' }} {{amount($product->prices['sale_price'],0)}}</span>
                            @if($product->prices['regular_price'] > 0  && $product->prices['regular_price'] > $product->prices['sale_price'])
                                <span class="text-gray-600 font-bold line-through text-sm md:text-md mt-1"> / <span class="">{{ $settings_g['currency_symbol'] ?? '৳' }}{{ $product->prices['regular_price'] }}</span></span>
                            @endif
                            {{--<h3 class="text-gray-600 text-sm flex items-center">/ <span class="line-through">600</span></h3>--}}
                        </div>
                    </div>
                </div>
            </div>

            {{-- <button type="button" onclick="addToCart('{{$product->id}}')" class="cursor-pointer w-full md:w-[90%] flex items-center bg-green-700 hover:bg-green-800 text-white hover:text-white justify-center group text-xs lg:text-sm xl:py-1 xl:rounded-full xl:border">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-4">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 1 0-7.5 0v4.5m11.356-1.993 1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 0 1-1.12-1.243l1.264-12A1.125 1.125 0 0 1 5.513 7.5h12.974c.576 0 1.059.435 1.119 1.007ZM8.625 10.5a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm7.5 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
                </svg>
                <span class="mt-1">Add to Bag</span>
            </button> --}}
            <a href="{{route('cart.directOrder', ['product' => $product->id])}}" class="cursor-pointer w-full md:w-[80%] flex items-center justify-center py-0 font-bold text-white transition-all duration-300 bg-orange-700 hover:bg-teal-700 ring-2 ring-orange-700 hover:ring-teal-700 ring-offset-2 ring-offset-orange-700 hover:ring-offset-teal-700 rounded-full group ease focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-4">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 1 0-7.5 0v4.5m11.356-1.993 1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 0 1-1.12-1.243l1.264-12A1.125 1.125 0 0 1 5.513 7.5h12.974c.576 0 1.059.435 1.119 1.007ZM8.625 10.5a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm7.5 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
                </svg>
                <span class="mt-1 group-hover:text-yellow-500 transition-colors duration-300">Buy Now</span>
            </a>            
        </div>
    </div>
</div>
