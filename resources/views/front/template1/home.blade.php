<div class="{{ $container }} mt-6">
    <div class="text-center">
        <h2 class="relative text-2xl mt-12 mb-4"><span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span> <span class="text-black">Featured Categories</span> <span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span></h2>

        <div class="grid grid-cols-3 md:grid-cols-5 gap-2 md:gap-5 mb-5">
            @foreach ($categories as $key => $category)
                @if($key < 4)
                    <a href="{{$category->route}}" class="relative overflow-hidden group">
                        <img src="{{$category->img_paths['small']}}" alt="{{$category->title}}">

                        {{--<div class="absolute left-0 bottom-4 w-full">
                            <span class="bg-white px-4 py-2.5 inline-block text-sm font-semibold hover:bg-[#222] hover:text-white t transition duration-300">{{$category->title}}</span>
                        </div>--}}
                    </a>
                @endif
            @endforeach
        </div>
        @include('front.template1.homeblock',['home_blocks'=>$home_blocks])
        <div class="load_home_items"></div>
    </div>
</div>