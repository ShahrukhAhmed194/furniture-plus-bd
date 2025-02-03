<div class="{{ $container }} mt-6">
    <div class="text-center">
        <h2 class="relative text-2xl mt-12 mb-10"><span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span> <span class="text-black">Featured Categories</span> <span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span></h2>

        <!-- TODO: loop through this list with actual categories -->
        <div class="flex flex-wrap gap-5 items-center justify-center">
            @foreach ($categories as $key => $category)
                @if($key < 9)
                    <div class="category p-4 border rounded-lg flex flex-col gap-3 items-center">
                        <h3>{{$category->title}}</h3>
                        <img src="{{$category->img_paths['medium']}}" alt="{{$category->title}}" class="h-[50px]">
                    </div>
                @endif
            @endforeach
        </div>
    </div>
    @include('front.template2.homeblock',['home_blocks'=>$home_blocks])
    <div class="load_home_items"></div>
</div>
