﻿using System.Collections.Generic;
using System.Linq;
using Common.Models;
using DataTier.AdService;

namespace DataTier.Business
{
    public class Convert : IConvert
    {
        public Ad ToAd(AdDto adDto)
        {
            return new Ad()
            {
                Id = adDto.Id,
                UserId = adDto.UserId,
                Name = adDto.Name,
                Description = adDto.Description,
                Picture = adDto.Picture,
                Price = adDto.Price,
                Category = adDto.CategoryId,
                CreationDate = adDto.CreationDate,
                LocationId = adDto.LocationId,
                Type = adDto.TypeId,
                Condition = adDto.ConditionId
            };
        }

        public Category ToCategory(CategoryDto categoryDto)
        {
            return new Category()
            {
                CategoryId = categoryDto.CategoryId,
                CategoryName = categoryDto.CategoryName,
                ParentCategoryId = categoryDto.ParentCategoryId
            };
        }

        public User ToUser(UserDto userDto)
        {
            return new User()
            {
                UserId = userDto.UserId,
                UserName = userDto.UserName,
                Password = userDto.Password,
                RoleId = userDto.RoleId,
            };
        }

        public List<Category> ToCategories(List<CategoryDto> categoriesDto)
        {
            return categoriesDto.Select(ToCategory).ToList();
        }

        public IEnumerable<Ad> ToAds(IEnumerable<AdDto> adsDto)
        {
            return adsDto.Select(ToAd).ToList();
        }

        public IEnumerable<User> ToUsers(IEnumerable<UserDto> usersDto)
        {
            return usersDto.Select(ToUser).ToList();
        }
    }
}
