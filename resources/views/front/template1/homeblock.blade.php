@foreach ($home_blocks as $key => $home_block)

    <h2 class="relative text-2xl mt-2 mb-2"><span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span> <span class="text-black">{{$home_block->title}}</span> <span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span></h2>

    @php
        //$products = $home_block->Products()->with('Gallery')->latest('id')->take(8)->get();
        $products = $home_block->Products()->latest('id')->take(8)->get();
    @endphp

    <div class="owl-carousel_normal owl-carousel owl-theme mb-6">
        @foreach ($products as $product)
            @include('front.layouts.product-loop',['product'=>$product])
        @endforeach
    </div>
    <a href="{{$home_block->route}}" class="px-10 py-1 bg-[#222] rounded-full text-white font-medium mb-2 relative overflow-hidden group inline-block"><span class="absolute top-0 w-full h-full bg-[#d79290] z-0 -left-full group-hover:left-0 transition-all duration-300"></span> <span class="relative z-10">View All</span></a>

    {{--
        @if($key == 0)
        <h2 class="relative text-2xl mt-12 mb-10"><span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span> <span class="text-black">Featured Categories</span> <span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span></h2>

        <div class="grid grid-cols-1 md:grid-cols-4 gap-7">
            @foreach ($categories as $c_key => $category)
                @if($c_key > 3 && $c_key < 7)
                    <a href="{{$category->route}}" class="relative overflow-hidden group h-full {{$c_key == 5 ? 'md:col-span-2' : ''}}">
                        <img src="{{$category->img_paths['original']}}" class="w-full group-hover:scale-110 transition duration-1000 h-full object-cover" alt="{{$category->title}}">

                        <div class="absolute left-0 bottom-4 w-full">
                            <span class="bg-white px-4 py-2.5 inline-block text-sm font-semibold hover:bg-[#222] hover:text-white t transition duration-300">{{$category->title}}</span>
                        </div>
                    </a>
                @endif
            @endforeach
        </div>
        @endif

        @if($key == 1)
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-8 mb-8">
            @foreach ($categories as $c_key => $category)
            @if($c_key > 6 && $c_key < 11)
            <a href="{{$category->route}}" class="relative block">
                <img src="{{$category->img_paths['original']}}" class="w-full" alt="{{$category->title}}">

                <div class="absolute left-0 top-0 w-full h-full flex items-center justify-center text-3xl md:text-5xl">
                    <span class="font-shadow">{{$category->title}}</span>
                </div>
            </a>
            @endif
            @endforeach
        </div>
        <h2 class="relative text-2xl mt-12 mb-10"><span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span> <span class="text-black">Featured Categories</span> <span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span></h2>

        <div class="grid grid-cols-2 md:grid-cols-4 gap-7">
            @foreach ($categories as $c_key => $category)
                @if($c_key > 10 && $c_key < 15)
                    <a href="{{$category->route}}" class="relative overflow-hidden group">
                        <img src="{{$category->img_paths['medium']}}" alt="{{$category->title}}">

                        <div class="absolute left-0 bottom-4 w-full">
                            <span class="bg-white px-4 py-2.5 inline-block text-sm font-semibold hover:bg-[#222] hover:text-white t transition duration-300">{{$category->title}}</span>
                        </div>
                    </a>
                @endif
            @endforeach
        </div>
        @endif
        --}}
@endforeach