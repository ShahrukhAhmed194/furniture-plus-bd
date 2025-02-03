@foreach($errors->all() as $error)
<div class="alert alert-danger text-red-400" role="alert">{{$error}}</div>
@endforeach
