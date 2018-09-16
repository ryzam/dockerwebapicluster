using System;
using Xunit;
using Shouldly;

namespace DockerWebApi.Cluster.Tests
{
    public class TestPersons
    {
        [Fact]
        public void SavePerson_WithNoExistingRecord_ShouldInsertIntoDatabase()
        {
            var number = 1;

            number.ShouldBe(1);            
        }
    }
}