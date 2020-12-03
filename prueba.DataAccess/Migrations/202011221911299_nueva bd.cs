namespace prueba.DataAccess.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class nuevabd : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Actividad",
                c => new
                {
                    Id_actividad = c.Int(nullable: false, identity: true),
                    Nombre_actividad = c.String(nullable: false, unicode: false),
                    Valor_actividad = c.Int(nullable: false),
                    Id_grupo = c.Int(nullable: false),
                })
                .PrimaryKey(t => t.Id_actividad)
                .ForeignKey("dbo.Grupo", t => t.Id_grupo, cascadeDelete: true);
            Sql("CREATE index `IX_Id_grupo` on `Actividad` (`Id_grupo` DESC)");

            //.Index(t => t.Id_grupo);

            CreateTable(
                "dbo.Alumno_actividad",
                c => new
                {
                    Id_alumno = c.Int(nullable: false),
                    Id_actividad = c.Int(nullable: false),
                    calificacion = c.Int(nullable: false),
                })
                .PrimaryKey(t => new { t.Id_alumno, t.Id_actividad })
                .ForeignKey("dbo.Actividad", t => t.Id_actividad, cascadeDelete: true)
                .ForeignKey("dbo.Alumno", t => t.Id_alumno, cascadeDelete: true);

            Sql("CREATE index `IX_Id_actividad` on `Alumno_actividad` (`Id_actividad` DESC)");
            Sql("CREATE index `IX_Id_alumno` on `Alumno_actividad` (`Id_alumno` DESC)");
            //.Index(t => t.Id_alumno)
            //.Index(t => t.Id_actividad);

            CreateTable(
                "dbo.Alumno",
                c => new
                    {
                        Id_alumno = c.Int(nullable: false, identity: true),
                        Nombre_alumnoCompleto = c.String(unicode: false),
                    })
                .PrimaryKey(t => t.Id_alumno);

            CreateTable(
                "dbo.Asistencia",
                c => new
                {
                    Id_alumno = c.Int(nullable: false),
                    Fecha = c.String(nullable: false, maxLength: 128, storeType: "nvarchar"),
                    Respuesta_asistencia = c.String(unicode: false),
                })
                .PrimaryKey(t => new { t.Id_alumno, t.Fecha })
                .ForeignKey("dbo.Alumno", t => t.Id_alumno, cascadeDelete: true);
            Sql("CREATE index `IX_Id_alumno` on `Asistencia` (`Id_alumno` DESC)");
            //.Index(t => t.Id_alumno);

            CreateTable(
                "dbo.Grupo_alumno",
                c => new
                {
                    Id_alumno = c.Int(nullable: false),
                    Id_grupo = c.Int(nullable: false),
                })
                .PrimaryKey(t => new { t.Id_alumno, t.Id_grupo })
                .ForeignKey("dbo.Alumno", t => t.Id_alumno, cascadeDelete: true)
                .ForeignKey("dbo.Grupo", t => t.Id_grupo, cascadeDelete: true);

            Sql("CREATE index `IX_Id_alumno` on `Grupo_alumno` (`Id_alumno` DESC)");
            Sql("CREATE index `IX_Id_grupo` on `Grupo_alumno` (`Id_grupo` DESC)");

            //.Index(t => t.Id_alumno)
            //.Index(t => t.Id_grupo);

            CreateTable(
                "dbo.Grupo",
                c => new
                {
                    Id_grupo = c.Int(nullable: false, identity: true),
                    Nombre_grupo = c.String(nullable: false, unicode: false),
                    pass_grupo = c.String(nullable: false, unicode: false),
                    Id_maestro = c.Int(nullable: false),
                })
                .PrimaryKey(t => t.Id_grupo)
                .ForeignKey("dbo.maestro", t => t.Id_maestro, cascadeDelete: true);

            Sql("CREATE index `IX_Id_maestro` on `Grupo` (`Id_maestro` DESC)");
            //.Index(t => t.Id_maestro);

            CreateTable(
                "dbo.maestro",
                c => new
                    {
                        Id_maestro = c.Int(nullable: false, identity: true),
                        Nombre_maestro = c.String(nullable: false, unicode: false),
                        Apellido_maestro = c.String(nullable: false, unicode: false),
                        Usuario_maestro = c.String(nullable: false, unicode: false),
                        Pass_maestro = c.String(nullable: false, unicode: false),
                        Email = c.String(nullable: false, unicode: false),
                    })
                .PrimaryKey(t => t.Id_maestro);

            CreateTable(
                "dbo.Mensaje_alumno_maestro",
                c => new
                {
                    Id_alumno = c.Int(nullable: false),
                    Id_maestro = c.Int(nullable: false),
                    Id_mensaje = c.Int(nullable: false),
                })
                .PrimaryKey(t => new { t.Id_alumno, t.Id_maestro, t.Id_mensaje })
                .ForeignKey("dbo.Alumno", t => t.Id_alumno, cascadeDelete: true)
                .ForeignKey("dbo.Comentario", t => t.Id_mensaje, cascadeDelete: true)
                .ForeignKey("dbo.maestro", t => t.Id_maestro, cascadeDelete: true);
            Sql("CREATE index `IX_Id_alumno` on `Mensaje_alumno_maestro` (`Id_alumno` DESC)");
            Sql("CREATE index `IX_Id_mensaje` on `Mensaje_alumno_maestro` (`Id_mensaje` DESC)");
            Sql("CREATE index `IX_Id_maestro` on `Mensaje_alumno_maestro` (`Id_maestro` DESC)");
            //.Index(t => t.Id_alumno)
            //.Index(t => t.Id_maestro)
            //.Index(t => t.Id_mensaje);

            CreateTable(
                "dbo.Comentario",
                c => new
                    {
                        Id_mensaje = c.Int(nullable: false, identity: true),
                        Mensaje = c.String(nullable: false, unicode: false),
                    })
                .PrimaryKey(t => t.Id_mensaje);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Actividad", "Id_grupo", "dbo.Grupo");
            DropForeignKey("dbo.Alumno_actividad", "Id_alumno", "dbo.Alumno");
            DropForeignKey("dbo.Grupo_alumno", "Id_grupo", "dbo.Grupo");
            DropForeignKey("dbo.Grupo", "Id_maestro", "dbo.maestro");
            DropForeignKey("dbo.Mensaje_alumno_maestro", "Id_maestro", "dbo.maestro");
            DropForeignKey("dbo.Mensaje_alumno_maestro", "Id_mensaje", "dbo.Comentario");
            DropForeignKey("dbo.Mensaje_alumno_maestro", "Id_alumno", "dbo.Alumno");
            DropForeignKey("dbo.Grupo_alumno", "Id_alumno", "dbo.Alumno");
            DropForeignKey("dbo.Asistencia", "Id_alumno", "dbo.Alumno");
            DropForeignKey("dbo.Alumno_actividad", "Id_actividad", "dbo.Actividad");
            DropIndex("dbo.Mensaje_alumno_maestro", new[] { "Id_mensaje" });
            DropIndex("dbo.Mensaje_alumno_maestro", new[] { "Id_maestro" });
            DropIndex("dbo.Mensaje_alumno_maestro", new[] { "Id_alumno" });
            DropIndex("dbo.Grupo", new[] { "Id_maestro" });
            DropIndex("dbo.Grupo_alumno", new[] { "Id_grupo" });
            DropIndex("dbo.Grupo_alumno", new[] { "Id_alumno" });
            DropIndex("dbo.Asistencia", new[] { "Id_alumno" });
            DropIndex("dbo.Alumno_actividad", new[] { "Id_actividad" });
            DropIndex("dbo.Alumno_actividad", new[] { "Id_alumno" });
            DropIndex("dbo.Actividad", new[] { "Id_grupo" });
            DropTable("dbo.Comentario");
            DropTable("dbo.Mensaje_alumno_maestro");
            DropTable("dbo.maestro");
            DropTable("dbo.Grupo");
            DropTable("dbo.Grupo_alumno");
            DropTable("dbo.Asistencia");
            DropTable("dbo.Alumno");
            DropTable("dbo.Alumno_actividad");
            DropTable("dbo.Actividad");
        }
    }
}
