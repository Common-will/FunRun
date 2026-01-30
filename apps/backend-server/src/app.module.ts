import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { RunsModule } from './modules/runs/runs.module';
import { UsersModule } from './modules/users/users.module';

@Module({
  imports: [
    // Future: TypeOrmModule.forRoot(...) for DB connection
    RunsModule,
    UsersModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }

