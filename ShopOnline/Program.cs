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
builder.Services.AddSession();

// Th�m HttpContextAccessor ?? truy c?p HttpContext t? c�c class kh�c
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

app.UseAuthorization();
app.UseSession();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
