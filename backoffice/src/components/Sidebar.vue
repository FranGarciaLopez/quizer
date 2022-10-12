<template>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <span class="fs-5 d-none d-sm-inline">Backoffice</span>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                        <router-link to="/" class="nav-link align-middle px-0">
                            <i class="bi bi-house" style="font-size: 2rem;"></i> <span class="ms-1 d-none d-sm-inline" style="font-size: 2rem;"> Home</span>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/users" class="nav-link align-middle px-0">
                            <i class="bi bi-people-fill" style="font-size: 2rem;"></i> <span class="ms-1 d-none d-sm-inline" style="font-size: 2rem;"> Users</span>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/paths" class="nav-link align-middle px-0">
                            <i class="bi bi-archive" style="font-size: 2rem;"></i> <span class="ms-1 d-none d-sm-inline" style="font-size: 2rem;"> Paths</span>
                        </router-link>
                    </li>
                </ul>
                <hr>
            </div>
        </div>
        <section class="col py-3">
            <slot name="body">
                
            </slot>
       </section>
    </div>
</div>
</template>

<script>

export default {
    
}
</script>
