<template>
    <div class="sidebar">
        <div class="title">
            Backoffice
        </div>    
        <div class="menu-items">
            
            <router-link to="/users" active-class="active" tag="button" class="side-btn">
                <div class="link-container">
                    Users    
                </div>            
            </router-link>

            <router-link to="/paths" active-class="active" tag="button" class="side-btn">
                <div class="link-container">
                    Paths    
                </div>            
            </router-link>

            <router-link to="/questions" active-class="active" tag="button" class="side-btn">
                <div class="link-container">
                    Questions
                </div>            
            </router-link>
            <router-link to="/topics" active-class="active" tag="button" class="side-btn">
                <div class="link-container">
                    Topics  
                </div>            
            </router-link>
            <router-link to="/resources" active-class="active" tag="button" class="side-btn">
                <div class="link-container">
                    Resources  
                </div>            
            </router-link>
            
        </div>
    </div>    
</template>

<script>

export default {
    
}
</script>

<style scoped>
    .title{
        color: white;
        font-size: 24px;
        margin-top: 10px;
    }
    .menu-items{
        display: flex;
        flex-direction: column;
        margin-top: 40px;
        margin-bottom: 40px;

    }
    .menu-items > *{
        margin-top: 40px;
    }

    .side-btn:focus{
        outline: none;
    }

    .side-btn.active{
        background-color: white;
        color: teal;
        font-weight: 500;
    }

    .side-btn{
        border: none;
        padding: 10px 0px;
        cursor: pointer;
        font-size: 16px;
        color: white;
    }

</style>