<div class="bg-transparent overflow-hidden border border-gray-200 border-t-0 border-l-0 border-r-1 border-b-0">
    <div>
        <a href="{{$product->route}}" class="hover:underline transition-all bg-transparent ">
            <img class="max-w-[200px] mx-auto" src="{{$product->img_paths['medium']}}" alt="{{$product->title}}" />
        </a>
        <div class="p-1">
            <div class="flex items-baseline">
                @if($product->custom_label)
                    <span class="inline-block bg-teal-200 text-teal-800 py-1 mr-2 px-2 md:px-4 text-xs rounded-full uppercase font-semibold ">{{$product->custom_label}}</span>
                @endif
                <div class="text-gray-600 text-xs uppercase font-semibold tracking-wide">
                    @foreach($product->Categories->splice(0,1) as $cat)
                        {{$cat->title}}
                    @endforeach
                </div>
            </div>
            <h2 class="mt-3 font-semibold leading-tight truncate text-sm md:text-lg">
                <a href="{{$product->route}}" class="hover:underline transition-all">{{ $product->title }}</a>
            </h2>

            <div class="flex items-center justify-between flex-col md:flex-row mt-3">
                <div class="text-sm md:text-lg">
                    <div class="flex items-center">
                        <span class="font-bold">৳{{amount($product->sale_price)}}</span>
                        {{--<h3 class="text-gray-600 text-sm flex items-center">/ <span class="line-through">600</span></h3>--}}
                    </div>
                </div>
                {{--<div class="flex items-center">
                        <span class="text-teal-600 font-semibold">
                            <span>4.4</span>
                        </span>
                    <span class="ml-2 text-gray-600 text-sm">(34 reviews)</span>
                </div>--}}
            </div>
            <div class="mt-2 flex items-center justify-between ">
                <a href="{{route('cart.directOrder', ['product' => $product->id])}}" class="px-3 md:px-2 xl:px-3 py-2 rounded-full bg-green-700 text-xs lg:text-sm text-white hover:bg-green-800">Buy Now</a>
                <button type="button" onclick="addToCart('{{$product->id}}')" class="cursor-pointer flex items-center justify-center gap-1 group xl:px-2 text-xs lg:text-sm xl:py-1 xl:rounded-full xl:border">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-7 group-hover:text-green-700">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 1 0-7.5 0v4.5m11.356-1.993 1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 0 1-1.12-1.243l1.264-12A1.125 1.125 0 0 1 5.513 7.5h12.974c.576 0 1.059.435 1.119 1.007ZM8.625 10.5a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm7.5 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
                    </svg>
                    <span class="mt-1 group-hover:text-green-700 hidden xl:block">Add to Bag</span>
                </button>

            </div>
        </div>
    </div>
</div>

