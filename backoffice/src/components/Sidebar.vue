<template>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <span class="fs-5 d-none d-sm-inline align-items-center"><i class="bi bi-bootstrap" style="font-size: 2rem;"></i> Backoffice</span>
                <hr class="w-100">
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start " id="menu">
                    <li class="nav-item">
                        <router-link to="/admin/users" class="nav-link align-middle px-0 text-white">
                            <i class="bi bi-people-fill" style="font-size: 1.5rem;"></i> <span class="ms-1 d-none d-sm-inline" style="font-size: 1.5rem;"> Users</span>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/admin/paths" class="nav-link align-middle px-0 text-white">
                            <i class="bi bi-archive" style="font-size: 1.5rem;"></i> <span class="ms-1 d-none d-sm-inline" style="font-size: 1.5rem;"> Paths</span>
                        </router-link>
                    </li>
                </ul>
                <hr>
            </div>
        </div>
        <section class="col p-0">
            <slot name="body">
                
            </slot>
       </section>
    </div>
</div>
</template>

