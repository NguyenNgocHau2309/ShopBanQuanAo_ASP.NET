using Microsoft.EntityFrameworkCore;
using ShopOnline.Models;
using ShopOnline.Respository;
using Microsoft.AspNetCore.Http;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

var connectionString = builder.Configuration.GetConnectionString("QuanLyShopOnlineContext");
builder.Services.AddDbContext<QuanLyShopOnlineContext>(x => x.UseSqlServer(connectionString));

builder.Services.AddScoped<DanhMucRespository, DMRespository>();
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30); // **S?A: ??t th?i gian timeout cho session là 30 phút**
    options.Cookie.HttpOnly = true; // **S?A: Cookie ch? có th? truy c?p thông qua HTTP**
    options.Cookie.IsEssential = true; // **S?A: Cookie c?a session c?n thi?t cho ho?t ??ng**
});

// **ADD: Thêm HttpContextAccessor ?? truy c?p HttpContext t? các l?p khác**
builder.Services.AddHttpContextAccessor();
var app = builder.Build();


// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseSession();
app.UseAuthorization();


app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
