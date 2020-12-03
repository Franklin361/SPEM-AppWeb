namespace prueba.DataAccess.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class newcolumn : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Comentario", "FechaMensaje", c => c.String(unicode: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Comentario", "FechaMensaje");
        }
    }
}
