using System;
using Xunit;
using Flurl.Http;
using System.Threading.Tasks;
using Shouldly;
using System.Collections.Generic;

namespace DockerWebApi.Cluster.Integrations
{
    public class PersonTests
    {
        public const string apiRootUrl = "http://dockerwebapicluster";

        [Fact]
        public async Task Test1()
        {
            var urlApi = $"{apiRootUrl}/api/values";

            List<string> d = await urlApi.GetJsonAsync<List<string>>();

            Console.WriteLine(d);

            int num = 1;

            num.ShouldBe(1);
            
        }
    }
}
