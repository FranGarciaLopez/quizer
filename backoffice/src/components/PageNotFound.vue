<template>
    <div class="d-flex align-items-center justify-content-center vh-100" style="background: linear-gradient(#d1e0f5, #b5cff3);">
            <div class="text-center">
            <h1 class="display-1 fw-bold">404</h1>
            <p class="fs-3"> <span class="text-danger">Opps!</span> Page not found.</p>
            <p class="lead">
                The page you`re looking for doesn`t exist.
            </p>
            <router-link to="/login" class="btn btn-primary">Make a login</router-link>
        </div>
    </div>
</template>

<script>
export default{
    name: 'PageNotFound'
}
</script>

