using MongoDB.Bson;
using MongoDB.Driver;
using dotenv.net;

public record PersonalInfo(
  string Name,
  int Age
);

public record SchoolInfo(
  string Id,
  string Address,
  PersonalInfo[] students
);

public static class Program
{
  public static void Main()
  {
    DotEnv.Load();
    var envVars = DotEnv.Read();

    string connectionString = envVars["CONNECTION_STRING"];

    var client = new MongoClient(connectionString);

    var db = client.GetDatabase("my_db");

    // Container reference with creation if it does not alredy exist
    var collection = db.GetCollection<BsonDocument>("school");

    // Create new object and upsert (create or replace) to container
    Console.Write("Enter school name: ");
    var school = Console.ReadLine()!;
    Console.Write("Enter name: ");
    var name = Console.ReadLine()!;
    Console.Write("Enter age: ");
    var age = int.Parse(Console.ReadLine()!);

    // 検索クエリの作成
    var filter = Builders<BsonDocument>.Filter.Eq("_id", school);

    // ドキュメントを検索
    var document = collection.Find(filter).FirstOrDefault();

    if (document != null)
    {
      var update = Builders<BsonDocument>.Update.Push("students", new BsonDocument
      {
        { "Name", name },
        { "Age", age }
      });
      collection.UpdateOne(filter, update);
    }
    else
    {
      var newDocument = new BsonDocument
      {
        { "_id", school },
        { "students", new BsonArray {
          new BsonDocument {
            { "Name", name },
            { "Age", age }
          }
        } }
      };
      collection.InsertOne(newDocument);
    }

  }
}
