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
                        <span class="text-sm text-white px-2 py-[2px] rounded shadow {{ $product->stock > 0 ? 'bg-green-600' : 'bg-red-600' }}"> {{ $product->stock > 0 ? 'In Stock' : 'Out of Stock' }} </span>
                    </div>
                @else
                    <div class="items-start">
                        <span class="text-sm text-white px-2 py-[2px] rounded shadow {{ $product->stock > 0 ? 'bg-green-600' : 'bg-red-600' }}"> {{ $product->stock > 0 ? 'In Stock' : 'Out of Stock' }} </span>
                    </div>
                @endif

                <div class="flex items-start flex-col md:flex-row mt-0 mb-3">
                    <div class="text-sm md:text-lg">
                        <div class="flex flex-col">
                            <span class="font-bold text-[#f65004]">{{ $settings_g['currency_symbol'] ?? '৳' }} {{amount($product->prices['sale_price'],0)}}</span>
                            @if($product->prices['regular_price'] > 0  && $product->prices['regular_price'] > $product->prices['sale_price'])
                                <div class="flex-row">
                                    <span class="text-gray-600 font-bold line-through text-sm md:text-md">{{ $settings_g['currency_symbol'] ?? '৳' }}{{ $product->prices['regular_price'] }}</span>
                                    <span class="text-black font-bold text-sm md:text-md">&nbsp;{{ number_format((($product->prices['regular_price'] - $product->prices['sale_price']) / $product->prices['regular_price']) * 100, 2) }}%</span>
                                </div>
                            @endif
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
            <a href="{{route('cart.directOrder', ['product' => $product->id])}}" class="cursor-pointer w-full md:w-[90%] flex items-center justify-center py-0 font-bold text-white transition-all duration-300 bg-[#f65004] hover:bg-[#007789] ring-1 ring-[#f65004] hover:ring-[#007789] ring-offset-2 ring-offset-[#f65004] hover:ring-offset-[#007789] rounded-full group ease focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-4">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 1 0-7.5 0v4.5m11.356-1.993 1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 0 1-1.12-1.243l1.264-12A1.125 1.125 0 0 1 5.513 7.5h12.974c.576 0 1.059.435 1.119 1.007ZM8.625 10.5a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm7.5 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
                </svg>
                <span class="mt-1 transition-colors duration-300">Buy Now</span>
            </a>
            <span class="mb-2 flex items-center"> Review: 
                @for($i = 1; $i <= 5; $i++)
                    @if($i <= $product->average_rating)
                        <svg class="w-5 h-5 me-1 text-yellow-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                        </svg>
                    @else
                        <svg class="w-5 h-5 me-1 text-gray-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                        </svg>
                    @endif
                @endfor
            </span>
        </div>
    </div>
</div>
