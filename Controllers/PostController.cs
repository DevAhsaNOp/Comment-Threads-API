using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;
using WebApi.Models;

namespace WebApi.Controllers
{
    public class PostController : ApiController
    {
        private readonly PracticeEntities _context;

        public PostController()
        {
            _context = new PracticeEntities();
        }

        public JsonResult<List<Post>> Get()
        {
            var posts = _context.Posts.ToList();
            return Json(posts);
        }

        public JsonResult<PostData> GetCommentsThreadByPost(int id)
        {
            var post = _context.Posts.FirstOrDefault(p => p.PostID == id);
            if (post == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }

            var postComments = _context.Comments.Where(c => c.PostID == id && c.ParentCommentID == null)
                .Select(c => new CommentData
                {
                    CommentID = c.CommentID,
                    Content = c.Text,
                    CommentParentID = c.ParentCommentID,
                    UserID = c.UserID
                })
                .ToList();

            BuildCommentHierarchy(postComments, id);

            var postCommentsWithChildComments = new PostData
            {
                PostID = post.PostID,
                Title = post.Title,
                Content = post.Content,
                Comments = postComments
            };

            JsonSerializerSettings settings = new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            };

            return Json(postCommentsWithChildComments);
        }

        private void BuildCommentHierarchy(List<CommentData> comments, int postId)
        {
            foreach (var comment in comments)
            {
                comment.ChildComments = _context.Comments
                    .Where(c => c.PostID == postId && c.ParentCommentID == comment.CommentID)
                    .Select(c => new CommentData
                    {
                        CommentID = c.CommentID,
                        Content = c.Text,
                        CommentParentID = c.ParentCommentID,
                        UserID = c.UserID
                    })
                    .ToList();

                BuildCommentHierarchy(comment.ChildComments, postId);
            }
        }

    }

    public class PostData
    {
        public int PostID { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public List<CommentData> Comments { get; set; }
    }

    public class CommentData
    {
        public int CommentID { get; set; }
        public string Content { get; set; }
        public int? CommentParentID { get; set; }
        public int? UserID { get; set; }
        public List<CommentData> ChildComments { get; set; }
    }
}
