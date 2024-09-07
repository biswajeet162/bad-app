import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AComponent } from './a/a.component';
import { BComponent } from './b/b.component';
import { CComponent } from './c/c.component';

const routes: Routes = [
  { path: 'a', component: AComponent }, // Default route
  { path: 'b', component: BComponent },
  { path: 'c', component: CComponent },
  { path: '**', redirectTo: 'a' } // Wildcard route for a 404 page (redirects to home page)
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
